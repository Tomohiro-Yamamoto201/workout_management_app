class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include UsersHelper
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    
      # 渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    # 現在ログイン中のユーザーを返す (いる場合)
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end


    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :gender, :height, :body_weight, :born_on])
    end
    

    def after_sign_in_path_for(resource)
        user_path(resource) # ログイン後に遷移するpathを設定
    end
    
    def after_sign_out_path_for(resource)
        root_path # ログアウト後に遷移するpathを設定
    end


end
