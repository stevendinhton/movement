class UsersController < ApplicationController
  before_action :load_user, :except => [:new, :create, :validate_login]

  def new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user
      flash[:error] = "Username Already Exists"
      redirect_to request.env["HTTP_REFERER"]
    else
      @user = User.new
      @user.update_attributes(username: params[:user][:username], password: params[:user][:password])
      if @user.save
        flash[:notice] = "created"
        session[:current_user_id] = @user.id
      else
        flash[:error] = "error"
      end
      redirect_to :root
    end
  end

  def login
    redirect_to :root if @user
    # field for will fill the values
  end

  def validate_login
    @user = User.find_by_username(params[:user][:username])
    if @user
      if @user.password == params[:user][:password]
        flash[:notice] = "Logged In"
        session[:current_user_id] = @user.id
      else
        flash[:error] = "Incorrect Password"
      end
    else
      flash[:error] = "Incorrect Username"
    end
    redirect_to :root
  end

  def logout
    @user = nil
    session[:current_user_id] = nil
    redirect_to :root
  end

  def show
    return if @user
    flash[:error] = "Please login."
    redirect_to :login_users
  end

  private

  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end
end
