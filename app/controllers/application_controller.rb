class ApplicationController < ActionController::Base

  def current_user?
    current_user ||= if session[:user_id]
                        User.find(session[:user_id])
                      else
                        User.new
                      end
    current_user != nil
  end

  helper_method :current_user

  private

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
