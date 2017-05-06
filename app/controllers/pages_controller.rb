class PagesController < ApplicationController
  before_action :load_user

  def index
    @popular = []
    pages = Page.all.map{|p| {:page => p, :followers => p.num_followers}}.sort{|a,b| b[:followers] <=> a[:followers]}
    pages[0..3].each do |i|
      @popular << i[:page]
    end
    @recent = []
    pages = Page.order(created_at: :desc)
    pages[0..3].each do |i|
      @recent << i
    end
  end

  def new
    if @user
      @page = Page.new
    else
      flash[:error] = "Plase Login"
      redirect_to :login_users
    end
  end

  def create
    @page = Page.new
    @page.update_attributes(title: params[:page][:title], description: params[:page][:description], user_id: @user.id)
    if @page.save
      redirect_to @page
    else
      flash[:error] = "Could Not Create Movement"
      redirect_to request.env["HTTP_REFERER"]
    end
  end

  def show
    @page = Page.find_by_id(params[:id])
  end

  def search
    @page = Page.where("title like ?", "%#{params[:page][:title]}%")
  end

  private

  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end

end
