module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def user_is_logged_in?
    !current_user.nil?
  end

  def is_admin?
    current_user.is_admin
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
