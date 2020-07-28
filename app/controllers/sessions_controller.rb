class SessionsController < ApplicationController
  def new
  end

  def create

    auth = request.env['omniauth.auth']
    
    user = User.create_from_omniauth(auth)
    user.google_token = auth.credentials[:token]
    # refresh_token = access_token.credentials.refresh_token
    # user.google_refresh_token = refresh_token if refresh_token.present?
    user.save!
    cookies.encrypted[:current_user_id] = {value: user.id, expires: Time.now + 7.days}

    redirect_to root_path

    # require "pry"; binding.pry
    # current_user.update(token: auth['credentials']['token'])
    # current_user.update(github_username: auth['extra']['raw_info']['login'])
    # redirect_to dashboard_path
    # begin
    #   access_token = request.env['omniauth.auth']
    #   require "pry"; binding.pry
    #   current_user.update()
    #   user = User.from_omniauth(access_token)
    #   session[:user_id] = user.id
    #   flash[:success] = "Welcome! Please enter you name and birthday for your personalized readings"
    #   redirect_to profile_path
    # rescue
    #   flash[:warning] = "There was a problem while trying to authenticate you"
    #   redirect_to root_path
    # end
    # user.google_token= access_token.credentials.token
    # refresh_token = access_token.credentials.refresh_token
    # user.google_refresh_token = refresh_token if refresh_token.present?
    # user.save
    # redirect_to profile_path
  end

  def destroy
    cookies.encrypted[:current_user_id] = nil
    redirect_to root_path
  end
end
