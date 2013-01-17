class TokenAuthenticationsController < ApplicationController 

  def create
    @user = User.find(params[:user_id])
    @user.reset_authentication_token!
    redirect_to (:back)
  end

  def destroy
    @user = User.find(params[:id])
    @user.authentication_token = nil
    @user.save
    redirect_to (:back)
  end

end
