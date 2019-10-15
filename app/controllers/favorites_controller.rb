class FavoritesController < ApplicationController
  def create
   favorite = current_user.favorites.create(website_id: params[:website_id])
   redirect_to websites_url, notice: "#{favorite.website.user.name}さんのブログをお気に入り登録しました"
 end

 def destroy
   favorite = current_user.favorites.find_by(id: params[:id]).destroy
   redirect_to websites_url, notice: "#{favorite.website.user.name}さんのブログをお気に入り解除しました"
 end
end
