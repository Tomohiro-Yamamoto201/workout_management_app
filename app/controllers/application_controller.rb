class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include UsersHelper
    include SessionsHelper
    include Pagy::Backend
    before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :gender, :height, :body_weight, :born_on])
    end
    
        # 編集画面から画像を受け取れるよう設定
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: %i(image))
    end

    def after_sign_in_path_for(resource)
        user_path(resource) # ログイン後に遷移するpathを設定
    end
    
    def after_sign_out_path_for(resource)
        root_path # ログアウト後に遷移するpathを設定
    end

    # ユーザーのログインを確認する
    def logged_in_user
        unless logged_in?
          store_location #アクセスしようとしたURLを覚えておく
          flash[:danger] = "ログインしてください"
          redirect_to root_path
        end
    end





end
