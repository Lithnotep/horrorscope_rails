class SessionsController < ApplicationController
  def new
  end

  def create

    auth = request.env['omniauth.auth']
    current_user = User.create_from_omniauth(auth)
    current_user.update(google_token: auth.credentials[:token])

    @user = User.create_from_omniauth(auth)
    if @user.persisted?
      auth = request.env["omniauth.auth"]
      @user.google_token = auth.credentials[:token]
      @user.expires_at = auth.credentials[:expires_at]
      @user.google_refresh_token = auth.credentials[:refresh_token]
      cookies.encrypted[:user_id] = {value: @user.id, expires: Time.now + 7.days}
      @user.save!
      current_user = @user
      session[:user_id] = current_user.id

      redirect_to  profile_path

    else
      flash[:error] = "SOMETHING WENT HORRIBLY WRONG WHILE AUTHORIZING YOU. CHECK YOUR CREDENTIALS. IF YOU DARE."
      redirect_to root_path
    end
  end


  def destroy
    # cookies.encrypted[:user_id] = nil
    if current_user
      session.delete(:user_id)
      flash[:success] = "GOOD BYE. GOOD LUCK. OOGA BOOGA."
    end
    redirect_to root_path
  end
end
