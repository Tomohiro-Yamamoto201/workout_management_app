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

  def gravatar_for(user, options = {size: 50})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=https://booth.pximg.net/30829f4a-b2ee-4814-9ff3-c5e038d7bc0c/i/2114006/15fe8b65-15d8-41c6-b10b-c314a6397396_base_resized.jpg&?s=#{size}"
    image_tag(gravatar_url, alt: user.nickname, class: "gravatar")
  end
end
