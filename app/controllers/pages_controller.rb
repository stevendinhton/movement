class PagesController < ApplicationController
  before_action :load_user

  def index
    @popular = []
    pages = Page.all.map{|p| {:page => p, :followers => p.num_followers}}.sort{|a,b| b[:followers] <=> a[:followers]}
    pages[0..2].each do |i|
      @popular << i[:page]
    end
    @recent = []
    pages = Page.order(created_at: :desc)
    pages[0..2].each do |i|
      @recent << i
    end
  end

  def new
    if @user
      @page = Page.new
    else
      flash[:error] = "Please Login"
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
    _res_title = Page.where("title like ?", "%#{params[:pages][:title]}%")
    _res_desc = Page.where("description like ?", "%#{params[:pages][:title]}%")
    _user_id = User.find_by_username(params[:pages][:title]) ? User.find_by_username(params[:page][:title]).id : nil
    _res_user = Page.where(user_id: _user_id)
    @page = _res_title + _res_desc + _res_user
    @page = @page.uniq
  end

  private

  def load_user
    @user = User.find_by_id(session[:current_user_id])
  end

end
