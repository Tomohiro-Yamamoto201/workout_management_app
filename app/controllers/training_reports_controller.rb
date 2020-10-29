class TrainingReportsController < ApplicationController
    include Pagy::Backend
    before_action :logged_in_user, only: [:create, :destroy]

    def index
      @user = User.find(params[:id])
      @pagy, @training_reports = pagy(TrainingReport.all)
    end
    
    def show
        
    end
    
    def destroy
    
    end


end
