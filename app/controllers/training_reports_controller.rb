class TrainingReportsController < ApplicationController
    include Pagy::Backend
    before_action :logged_in_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]

    def index
      @training_reports = TrainingReport.all
      @user = User.find_by(params[:id])
      @users = User.all
      # 各投稿者の名前を表示するためのインスタンス変数
      
      @pagy, @training_reports = pagy(@training_reports)
    end
    
    def new
      # インスタンス変数を作成
      @user = User.find(params[:user_id])
      @training_report = TrainingReport.new
    end

    def show
      @training_report = TrainingReport.find(params[:id])
    end

    def create
      @training_report = TrainingReport.new(training_report_parameter)
      @training_report.user = current_user
      @user = User.find_by(params[:id])
      if @training_report.save
        redirect_to user_training_report_path(@user, @training_report)
        flash[:success] = "投稿が完了しました"  
      else
        render 'new'
        flash[:danger] = "投稿に失敗しました"
      end
      
    end
    
    def destroy
      @training_report = TrainingReport.find(params[:id])
      @user = User.find_by(params[:id])
      if @training_report.user_id == current_user.id
        if @training_report.destroy
          redirect_to user_training_reports_path(@training_report)
          flash[:success] = "投稿を削除しました"
        else
          redirect_to user_training_reports_path(@training_report)
          flash[:danger] = "投稿の削除に失敗しました"
        end
      end
    end

    private

        def training_report_parameter

            params.require(:training_report).permit(:content)
        end

end
