class UsersController < ApplicationController
before_action :require_user_logged_in, only: [:index, :show]
  def index
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products.order(id: :desc).page(params[:page])
    counts(@user)
    
  end

  def edit
   @user = User.find(params[:id])
   
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end 
    else
      redirect_to @user
    end
  end

  def destroy 
    @user = User.find_by(id: params[:id])
    @products = Product.find_by(user_id: params[:id])
    
    if @products.nil?
       current_user.destroy
      redirect_to("/")
      flash[:success] = 'ユーザーを削除しました。'
    else
      @products.destroy
      current_user.destroy
      redirect_to("/")
      flash[:success] = 'ユーザーを削除しました。'
    end
  end
    

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
    counts(@user)
  end
  
  def evaluates
    @user = User.find(params[:id])
    @evaluates = @user.evaluates.page(params[:page])
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name, :email, :password, :password_confirmation, :intro)
  end
end
