class TrainingReportsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def index
      @user = User.find(params[:id])
      @training_reports = @user.training_reports.paginate(page: params[:page])
    end
    
    def show
    
    end
    
    def destroy
    
    end


end
