class RcommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    rcomment = review.rcomments.build(rcomment_params) #buildを使い、contentとreview_idの二つを同時に代入
    rcomment.user_id = current_user.id
    if rcomment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end
  end

  private

    def rcomment_params
      params.require(:rcomment).permit(:content)
    end
end
