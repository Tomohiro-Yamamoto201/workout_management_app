class TrainingReportsController < ApplicationController
    include Pagy::Backend
    before_action :logged_in_user, only: [:create, :destroy]

    def index
      @user = User.find(params[:id])
      @pagy, @training_reports = pagy(TrainingReport.all)
    end
    
    def show
        
    end

    def create
      @training_report = TrainingReport.new(training_report_parameter)
      @training_report.user = current_user
      if @training_report.save
        redirect_to training_reports_path(current_user.id)
        flash[:success] = "投稿が完了しました"
      else
        redirect_to training_reports_path(current_user.id)
        flash[:danger] = "投稿に失敗しました"
      end
    end
    
    def destroy
    
    end

    private

        def training_report_parameter
            params.require(:training_report).permit(:content, :user_id)
        end

end
