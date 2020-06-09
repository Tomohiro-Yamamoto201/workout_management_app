module UsersHelper

   # 渡されたユーザーをログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  

  # 永続セッションとしてユーザーを記憶する
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end


    # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end

#   def current_user
#     if session[:user_id]
#         @current_user ||= User.find_by(id: session[:user_id])
#     end
#   end

end
