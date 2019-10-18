class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  before_action :correct_website, only:[:show, :edit, :update, :destroy]
  def index
    @websites = Website.all.order(id: "DESC")
  end

  def new
    @website = Website.new
  end

  def create
    @website = current_user.websites.build(website_params)
    if params[:back]
      render :new
    else
      if @website.save
        WebsiteMailer.website_mail(@website).deliver
        redirect_to new_website_path, notice: "投稿完了しました。投稿確認メールを送信しました"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(website_id: @website.id)
  end

  def edit
  end

  def confirm
    @website = current_user.websites.build(website_params)
    render :new if @website.invalid?
  end

  def update
    if @website.update(website_params)
      redirect_to website_path, notice: "編集完了"
    else
      render :edit
    end
  end

  def destroy
    @website.destroy
    redirect_to websites_path, notice:"投稿を削除しました"
  end

  private

  def website_params
    params.require(:website).permit(:content, :image, :image_cache)
  end

  def set_website
    @website = Website.find(params[:id])
  end

  def correct_website
    set_website
    redirect_to websites_path unless current_user_website?(@website)
  end

end
