class LcommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    lifestyle = Lifestyle.find(params[:lifestyle_id])
    lcomment = lifestyle.lcomments.build(lcomment_params) #buildを使い、contentとreview_idの二つを同時に代入
    lcomment.user_id = current_user.id
    if lcomment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end
  end

  private

    def lcomment_params
      params.require(:lcomment).permit(:content)
    end
end
