class ApplicationController < ActionController::Base
  include Pagy::Backend

  def render_flash_stream
    turbo_stream.update "flash", partial: "layouts/flash"
  end

private

  def require_signin
    unless signed_in?
      session[:intended_url] = request.url
      redirect_to signin_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def signed_in?
    !current_user.nil?
  end

  helper_method :signed_in?

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?
end
