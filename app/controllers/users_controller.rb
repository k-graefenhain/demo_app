class UsersController < ApplicationController
  # NOTE KG: add before_filter authenticate to destroy action in order to redirected a non-signed in user to the signin_path
  before_filter :authenticate, :only => [:edit, :update, :index, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def new
    # exercise 3, chapter 10.6
    redirect_to(root_path) unless !signed_in?

    @user = User.new
    @title = 'Sign up'
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    # exercise 3, chapter 10.6
    redirect_to(root_path) unless !signed_in?

    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    # NOTE KG: moved to correct_user
    #@user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    # NOTE KG: moved to correct_user
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    # exercise 5, chapter 10.6
    if current_user?(user)
      flash[:error] = "Can't destroy yourself."
    else
      user.destroy 
      flash[:success] = "User destroyed."
    end
    redirect_to users_path
  end


  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
