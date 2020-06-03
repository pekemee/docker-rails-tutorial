class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy,
                          :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :adimin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      #開発環境の場合　http://localhost:3000/rails/mailers/user_mailer
      flash[:info] = "登録用メールを送信しました。チェックして登録を完了してください。"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールは更新されました"
      redirect_to @user
    else
      render ''
    end
  end

  def destroy
    @user = User.find(params[:id])
    flash[:success] = "#{@user.name}を削除しました"
    @user.destroy
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #before_action

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def adimin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
