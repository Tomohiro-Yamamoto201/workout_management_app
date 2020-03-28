class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        pages_show_path
    end

    def post_params
        params.require(:user).permit(:nickname, :gender, :height, :body_weight)
      end

    private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end

end
