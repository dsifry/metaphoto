class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default root_url
  end

  def logout_facebook
    clear_facebook_session_information
    clear_fb_cookies!
    reset_session # i.e. logout the user
    flash[:notice] = "You have been disconnected from Facebook."
    redirect_to root_url
  end
end
