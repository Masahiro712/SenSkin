class LifestylesController < ApplicationController
    def index  
      @lifestyles = Lifestyle.all
      @lifestyles = @lifestyles.where("title LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
      @rtag = Ltag.select("name", "id")
      @lifestyles = @lifestyles.where("title LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
      if params[:ltag_ids].present?
        lifestyles_ids = []
        params[:ltag_ids].each do |key, value|
          if value == "1"
            Ltag.find_by(name: key).lifestyles.each do |p|
              lifestyles_ids << p.id
            end
          end
        end
        lifestyles_ids = lifestyles_ids.uniq
        #キーワードとタグのAND検索
        @lifestyles = @lifestyles.where(id: lifestyles_ids) if lifestyles_ids.present?
      elsif params[:new].present?
          @lifestyles = Lifestyle.sort_new
      elsif params[:old].present?
          @lifestyles = Lifestyle.sort_old
      elsif params[:good].present?
          @lifestyles = Lifestyle.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
      end

      if params[:rtag]
        Ltag.create(name: params[:rtag])
      end
  
      @ranking = Lifestyle.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
      @hosi = Lifestyle.order(overall: :desc)
      # @tyotto = @lifestyles.page(params[:page]).per(100)
      @saisin = Lifestyle.sort_new.first(3)
    end

    def new
        @lifestyle = Lifestyle.new
    end

    def create
      lifestyle = Lifestyle.new(lifestyle_params)

      lifestyle.user_id = current_user.id

      if lifestyle.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
        @lifestyle = Lifestyle.find_by(id: params[:id])
        unless @lifestyle
           redirect_to lifestyles_path, alert: "レビューが見つかりませんでした"
        end

        @lcomments = @lifestyle.lcomments
        @lcomment = Lcomment.new
    end

    def edit
      @lifestyle = Lifestyle.find(params[:id])
    end

    def update
      lifestyle = Lifestyle.find(params[:id])
      if lifestyle.update(lifestyle_params)
        redirect_to :action => "show", :id => lifestyle.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      lifestyle = Lifestyle.find(params[:id])
      lifestyle.destroy
      redirect_to action: :index
    end

    def search
      @ltag_list = Ltag.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
      @ltag = Ltag.find(params[:ltag_id])  # クリックしたタグを取得
      @litirans = @ltag.lifestyles.all        # クリックしたタグに紐付けられた投稿を全て表示
    end

    private

    def lifestyle_params
      params.require(:lifestyle).permit(:title, :comment, :image, ltag_ids: [])
    end
end
