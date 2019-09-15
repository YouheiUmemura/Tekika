class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  def index
  end

  def show
  end

  def create
    product = Product.find_by(params[:product_id])
    current_user.review(product)
   flash[:success] = "商品を評価しました。"
    redirect_to root_url
    
    
    # product = Product.find(params[:product_id])
    # current_user.favorite(product)
    # flash[:success] = "商品をいいねしました。"
    # redirect_to root_url
  end
end
