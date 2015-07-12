class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :require_user, :feature_active?

  def require_user
    redirect_to login_path, notice: "Please log in." unless signed_in?
  end

  def require_subscriber
    unless paid?
      flash[:error] = "Your trial has expired. If you'd like to keep writing, please subscribe below."
      redirect_to edit_user_path(current_user)
    end
  end

  def require_admin
    redirect_to root_path unless signed_in? && admin?
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def set_current_user(user_id)
    session[:user_id] = user_id
  end

  def signed_in?
    current_user.present?
  end

  def admin?
    current_user.admin == true
  end

  def paid?
    current_user.paid || current_user.days_left_in_trial > 0
  end

  def feature_active?(feature)
    if current_user.present? && admin?
      true
    else
      Feature.active?(feature)
    end
  end
end
