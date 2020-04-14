class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
   
    
    

    def after_sign_in_path_for(resource)
        users_show_path # ログイン後に遷移するpathを設定
     end
    
     def after_sign_out_path_for(resource)
        root_path # ログアウト後に遷移するpathを設定
     end


end
