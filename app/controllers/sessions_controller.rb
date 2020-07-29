class SessionsController < ApplicationController
  def new
  end

  def create

    auth = request.env['omniauth.auth']
    # harbinger = Harbinger.new(birthday)
    current_user = User.create_from_omniauth(auth)
    current_user.update(google_token: auth.credentials[:token])
    # refresh_token = access_token.credentials.refresh_token
    # user.google_refresh_token = refresh_token if refresh_token.present?
    current_user.save!
    session[:user_id] = current_user.id
    # cookies.encrypted[:user_id] = {value: current_user.id, expires: Time.now + 7.days}

    redirect_to profile_path
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
