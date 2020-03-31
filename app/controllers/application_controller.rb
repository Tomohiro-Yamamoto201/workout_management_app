class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    def configure_permitted_parameters　#任意のカラムの値を保存
        devise_parameter_sanitizer.for(:sign_up) << :nickname, :gender, :height, :body_weight, :born_on
    end

    def after_sign_in_path_for(resource)
        users_show_path # ログイン後に遷移するpathを設定
     end
    
     def after_sign_out_path_for(resource)
        root_path # ログアウト後に遷移するpathを設定
     end


end
