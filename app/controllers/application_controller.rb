class ApplicationController < ActionController::Base

  inertia_share flash: -> {
    {
      notice: flash.notice,
      alert: flash.alert
    }
  }

  def require_user_logged_in!
    flash[:alert] = 'You must be signed in to view that page.'
    redirect_to login_path
  end

end
