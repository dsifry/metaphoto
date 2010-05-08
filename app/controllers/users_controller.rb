class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @role = Role.find_by_name('User')
    @user.roles = [ @role ]
    if @user.save
      flash[:notice] = "Account registered! Now you're ready to link your Facebook account, so we can make tagging your friends in photos easier."
      redirect_to root_url
#      redirect_back_or_default { :action => :link_facebook }
    else
      render :action => :new
    end
  end

  def index
    @users = User.find :all
  end

  def link_facebook
    flash[:notice] = ""
  end
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_url
    else
      render :action => :edit
    end
  end
end

