class TrainingMenusController < ApplicationController

  def index
    # 現在のユーザーに紐づいているトレーニングメニューを取得する
    @training_menus = TrainingMenu.where(user_id: current_user.id)
  end

  def new
    @training_menu = TrainingMenu.new
  end

  def show
    # ビューからトレーニングメニューのidを受け取り、それをインタスタンス変数に格納する
    @training_menu = TrainingMenu.find(params[:id])
  end

  def create
    # ビューから受け取ったものでトレーニングメニューを作り、saveする
    @training_menu = TrainingMenu.new(training_menu_parameter)
    binding.pry
    if @training_menu.save
        redirect_to new_training_path(current_user.id)
        flash[:success] = "メニュー名を決定しました。詳細情報を入力してください"
    else        
        redirect_to trainings_path
        flash[:danger] = "メニュー名の決定に失敗しました。正しい情報を入力してください"
    end   
  end

  def destroy
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.destroy
        redirect_to training_menus_path, notice:"削除しました"
    else
        redirect_to trainings_path
    end
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.update(training_menu_parameter)
      redirect_to trainings_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def training_menu_parameter
    params.require(:training_menu).permit(:training_menu, :published_at, :user_id)
  end

end
