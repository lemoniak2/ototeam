class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def not_authenticated
    redirect_to login_path
  end
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
