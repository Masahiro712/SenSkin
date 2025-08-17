class UsersController < ApplicationController

    def mypage
        @user = User.find(params[:id])
    end
        
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to :action => "mypage", :id => @user.id
      else
        flash.now[:alert] = "更新に失敗しました"
        render :edit
      end
    end

    private
    def user_params
      params.require(:user).permit(:image, :selfintroduction)
    end


end
