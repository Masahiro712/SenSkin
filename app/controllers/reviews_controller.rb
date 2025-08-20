class ReviewsController < ApplicationController

  def index  
    @reviews = Review.all
    @reviews = @reviews.where("item LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    @rtag = Rtag.select("name", "id")
    @reviews = @reviews.where("item LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    if params[:rtag_ids].present?
      reviews_ids = []
      params[:rtag_ids].each do |key, value|
        if value == "1"
          Rtag.find_by(name: key).reviews.each do |p|
            reviews_ids << p.id
          end
        end
      end
      reviews_ids = reviews_ids.uniq
      #キーワードとタグのAND検索
      @reviews = @reviews.where(id: reviews_ids) if reviews_ids.present?
    elsif params[:new].present?
        @reviews = Review.sort_new
    elsif params[:old].present?
        @reviews = Review.sort_old
    elsif params[:good].present?
        @reviews = Review.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    end

    if params[:rtag]
      Rtag.create(name: params[:rtag])
    end

    @ranking = Review.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @hosi = Review.order(overall: :desc)
    # @tyotto = @reviews.page(params[:page]).per(100)
    @saisin = Review.sort_new.first(3)
  end

    def new
      @review = Review.new
    end
         
    def create
      review = Review.new(review_params)

      review.user_id = current_user.id

      if review.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @review = Review.find_by(id: params[:id])
      unless @review
        redirect_to reviews_path, alert: "レビューが見つかりませんでした"
      end

      @rcomments = @review.rcomments
      @rcomment = Rcomment.new

    end

    def edit
      @review = Review.find(params[:id])
    end

    def update
      review = Review.find(params[:id])
      if review.update(review_params)
        redirect_to :action => "show", :id => review.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      review = Review.find(params[:id])
      review.destroy
      redirect_to action: :index
    end

    def search
      @rtag_list = Rtag.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
      @rtag = Rtag.find(params[:rtag_id])  # クリックしたタグを取得
      @ritirans = @rtag.reviews.all        # クリックしたタグに紐付けられた投稿を全て表示
    end

    def toppage
      @rnews = Review.sort_new.first(3)
      @lnews = Lifestyle.sort_new.first(3)
    end

    private
    def review_params
      params.require(:review).permit(:item, :price, :url, :image, rtag_ids: [])
    end
end
