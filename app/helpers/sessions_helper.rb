module SessionsHelper
    
    
    
    # 記憶したURL (もしくはデフォルト値) にリダイレクト
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
  
    # アクセスしようとしたURLを覚えておく
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end
end