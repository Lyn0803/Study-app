class ApplicationController < ActionController::Base
  
  allow_browser versions: :modern

  before_action :authenticate!

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate!
    redirect_to login_path if current_user.blank?
  end
end
