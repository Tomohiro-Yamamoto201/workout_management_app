class TrainingReportsController < ApplicationController
    include Pagy::Backend
    before_action :logged_in_user, only: [:new, :create, :destroy]

    def index
      @training_reports = TrainingReport.where(user_id: current_user.id)
      @user = User.find_by(params[:id])
      @pagy, @training_reports = pagy(TrainingReport.all)
    end
    
    def new
      # インスタンス変数を作成
      @user_training_report = TrainingReport.new
    end

    def show
      @user_training_report = TrainingReport.find(params[:id])
    end

    def create
      @user_training_report = TrainingReport.new(training_report_parameter)
      @user_training_report.user = current_user
      if @user_training_report.save
        redirect_to user_training_report_path(current_user.id)
        flash[:success] = "投稿が完了しました"
      else
        redirect_to user_training_reports_path(current_user.id)
        flash[:danger] = "投稿に失敗しました"
      end

    end
    
    def destroy
    
    end

    private

        def training_report_parameter

            params.require(:user_training_report).permit(:content)
        end

end
