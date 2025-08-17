class LifestylesController < ApplicationController
    def index
        @lifestyles = Lifestyle.all

        @lranking = Lifestyle.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
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
