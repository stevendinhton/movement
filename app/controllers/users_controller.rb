class UsersController < ApplicationController
  before_action :load_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user
      redirect_to request.env["HTTP_REFERER"]
    end

    @user.update_attributes(username: params[:user][:username], password: params[:user][:password])
    if @user.save
      @text = "created"
      session[:current_user_id] = @user.id
    else
      @text = "error"
    end
  end

  def login
    @user = User.new
  end

  def validate_login
    @user = User.find_by_username(params[:user][:username])
    if @user
      if @user.password == params[:user][:password]
        @text = "Logged In"
        session[:current_user_id] = @user.id
      else
        @text = "Incorrect Password"
      end
    else
      @text = "Incorrect Username"
    end
    redirect_to :root
  end

  def logout
  end

  private

  def load_user
    @user = User.find(session[:current_user_id])
  end
end
