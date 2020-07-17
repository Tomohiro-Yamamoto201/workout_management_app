class TrainingsController < ApplicationController
      require 'pry'
      
      def index
        @trainings = current_user.trainings.all
      end
    
      def new
        @training = current_user.trainings
      end
    
      def show
        @training = current_user.trainings.find(params[:id])
      end
    
      def create
        @training = current_user.trainings.new(training_parameter)
        if @training.save
            redirect_to trainings_path(@user.id)
        else        
            redirect_to new_training_path
        end   
      end
    
      def destroy
        @training = current_user.trainings.find(params[:id])
        @training.destroy
        redirect_to trainings_path, notice:"削除しました"
      end
    
      def edit
        @training = current_user.trainings.find(params[:id])
      end
    
      def update
        @training = current_user.trainings.find(params[:id])
        if @training.update(training_parameter)
          redirect_to trainings_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    
      private
    
      def training_parameter
        params.require(:training).permit(:title, :content, :start_time)
      end
end
