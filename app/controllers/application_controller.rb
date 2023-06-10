class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end

  def after_sign_up_path_for(resource)
    tasks_path
  end
end
