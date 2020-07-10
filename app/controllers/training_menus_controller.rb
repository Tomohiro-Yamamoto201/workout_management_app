class TrainingMenusController < ApplicationController

  def index
    @training_menus = TrainingMenu.all
  end

  def new
    @training_menu = TrainingMenu.new
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
  end

  def create
    binding.pry
    @training_menu = TrainingMenu.new(training_menu_parameter)
    if @training_menu.save
        redirect_to new_training_path(@user.id)
    else        
        redirect_to new_training_menu_path
    end   
  end

  def destroy
    @training_menu = TrainingMenu.find(params[:id])
    @training_menu.destroy
    redirect_to training_menus_path, notice:"削除しました"
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.update(training_parameter)
      redirect_to trainings_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def training_menu_parameter
    params.require(:training_menu).permit(:training_menu)
  end
end
