class PagesController < ApplicationController
  before_action :load_user

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  private

  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end
end
