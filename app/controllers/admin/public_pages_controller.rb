class Admin::PublicPagesController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  

  def index
    @pages = PublicPage.all
  end

  def new
  end

  def create
    category = params[:public_page][:category]
    vk = VkontakteApi::Client.new
    screen_name = params[:public_page][:vk_url].split('/').last
    title = vk.groups.getById(group_ids: screen_name).first.name
    page = PublicPage.find_or_create_by_vk_url(screen_name)
    page.title = title
    page.save
    redirect_to admin_public_pages_path
  end

  def parse
    @public = PublicePage.find(params[:id])
    @public.parse!
  end 

end
