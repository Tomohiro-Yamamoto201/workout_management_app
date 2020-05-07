class TrainingsController < ApplicationController
    def index
        @trainings = Training.all
      end
    
      def new
        @trainings = Training.new
      end
    
      def show
        @trainings = Training.find(params[:id])
      end
    
      def create
        Training.create(Training_parameter)
        redirect_to Trainings_path
      end
    
      def destroy
        @training = Training.find(params[:id])
        @training.destroy
        redirect_to trainings_path, notice:"削除しました"
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
        params.require(:Training).permit(:title, :content, :start_time)
      end
end
