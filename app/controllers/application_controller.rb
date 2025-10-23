class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_login, :require_role

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    return if logged_in?
    redirect_to login_path, alert: "Please log in."
  end

  # Usage: before_action -> require_role(:admin) or require_role(:organizer)
  def require_role(*roles)
    unless logged_in? && roles.map(&:to_s).include?(current_user.role)
      redirect_to root_path, alert: "You are not authorized to do that."
    end
  end
end
