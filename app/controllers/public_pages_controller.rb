class Admin::PublicPagesController < ApplicationController
	before_filter :confirm_logged_in

  def index
  end

  def new
  end

  def create
    category = params[:public][:category]
    vk = VkontakteApi::Client.new
    screen_name = params[:public][:url].split('/').last
    title = vk.groups.getById(group_ids: screen_name).first.name
  	page = PublicePage.find_or_create_by_vk_url(screen_name)
    page.title = title
    page.category = "ero"
    page.save
  end

  def parse
  	@public = PublicePage.find(params[:id])
  	@public.parse!
  end 

end
