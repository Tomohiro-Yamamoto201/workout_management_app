class TrainingMenusController < ApplicationController
  before_action :set_user

  def index
    @training_menus = current_user.training_menus
  end

  def new
    @training_menu = current_user.training_menus
  end

  def show
    @training_menu = current_user.training_menus.find(params[:id])
  end

  def create
    @training_menu = current_user.training_menus.new(training_menu_parameter)
    if @training_menu.save
        redirect_to new_training_path(@user.id)
        flash[:success] = "メニュー名を決定しました。詳細情報を入力してください"
    else        
        redirect_to trainings_path
        flash[:danger] = "メニュー名の決定に失敗しました。正しい情報を入力してください"
    end   
  end

  def destroy
    @training_menu = current_user.training_menus.find(params[:id])
    @training_menu.destroy
    redirect_to training_menus_path, notice:"削除しました"
  end

  def edit
    @training_menu = current_user.training_menus.find(params[:id])
  end

  def update
    @training_menu = current_user.training_menus.find(params[:id])
    if @training_menu.update(training_menu_parameter)
      redirect_to trainings_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def training_menu_parameter
    params.require(:training_menu).permit(:training_menu, :user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
