class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'You are not authorized to peform that action!'
  end
end
