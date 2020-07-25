class TrainingsController < ApplicationController
      require 'pry'
      
      def index
        @trainings = Training.where(id:current_user.id)
      end
    
      def new
        @training = Training.new
        @training_menus = TrainingMenu.where(user_id:current_user.id)
      end
    
      def show
        @training = Training.find(params[:id])
      end
    
      def create
        @training = Training.new(training_parameter)
        @training.user = current_user
        @training_menus = TrainingMenu.where(user_id:current_user.id)
        @training.save!
            redirect_to training_path(current_user.id)
            flash[:success] = "トレーニング予定を作成しました"
        
            # redirect_to new_trainings_path
            # flash[:danger] = "トレーニング予定を作成できませんでした。正しい情報を入力してください"
      end
    
      def destroy
        @training = Training.find(params[:id])
        if @training_menu.destroy
            redirect_to trainings_path, notice:"削除しました"
        else
            redirect_to trainings_path, notice:"削除できませんでした"
        end
      end
    
      def edit
        @training = Training.find(params[:id])
      end
    
      def update
        @training = Training.find(params[:id])
        if @training.update(training_parameter)
          redirect_to trainings_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    
      private
    
      def training_parameter
        params.require(:training).permit(:title, :content, :start_time, :growing_parts)
      end
end
