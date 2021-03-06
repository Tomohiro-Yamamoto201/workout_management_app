class TrainingsController < ApplicationController
      require 'pry'
      
      def index
        @trainings = Training.where(id:current_user.id)
      end
    
      def new
        @training_menu = TrainingMenu.where(user_id: current_user.id) .last
        @training = Training.new
      end
    
      def show
        @training = Training.find(params[:id])
      end
    
      def create
        @training_menu = TrainingMenu.where(user_id:current_user.id)
        @training = Training.new(training_parameter)
        @training.user = current_user
        if @training.save
            redirect_to training_path(@training)
            flash[:success] = "トレーニング予定を作成しました"
        else
            redirect_to new_training_path
            flash[:danger] = "トレーニング予定を作成できませんでした。正しい情報を入力してください"
        end
      end
    
      def destroy
        @training = Training.find(params[:id])
        @training_menu = TrainingMenu.find_by(id:@training.training_menu_id)
        if @training_menu.destroy
            redirect_to training_menus_path, notice:"削除しました"
        else
            redirect_to trainings_menus_path, notice:"削除できませんでした"
        end
      end
    
      def edit
        @training = Training.find(params[:id])
      end
    
      def update
        @training = Training.find(params[:id])
        if @training.update(training_parameter)
          redirect_to training_menus_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    
      private
    
      def training_parameter
        params.require(:training).permit(:title, :content, :start_time, :growing_parts, :training_menu_id)
      end
end
