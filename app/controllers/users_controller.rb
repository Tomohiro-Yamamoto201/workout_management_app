class UsersController < ApplicationController
  include Pagy::Backend
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @training_reports = TrainingReport.where(user_id: @user.id)
    @pagy, @training_reports = pagy(@training_reports)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user #redirect_to user_url(@user)と同義
      flash[:success] = "新規ユーザーを作成しました"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:nickname, :email, :gender, :height,
      :body_weight, :born_on, :password, :password_confirmation)
    end

    # beforeフィルター


    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
