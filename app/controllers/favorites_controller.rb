class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    # @favorite = Favorite.new(user_id: @current_user.id, product_id: params[:product_id])
    # @favorite.save
    # redirect_to("/products/#{params[:product_id]}")
    product = Product.find(params[:product_id])
    current_user.favorite(product)
    flash[:success] = "商品をいいねしました。"
    redirect_to root_url
    
    # いいねして画面以降いちいちしてたらうざい。
  end

  def destroy
#     @favorite = Favorite.find_by(user_id: @current_user.id, product_id: params[:product_id])
#     @favorite.destroy
# redirect_to("/products/#{params[:product_id]}")
  product = Product.find(params[:product_id])
    current_user.unfavorite(product)
    flash[:success] = "いいねを解除しました。"
    redirect_to root_url
  end
end

