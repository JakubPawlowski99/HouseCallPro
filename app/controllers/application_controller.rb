class ApplicationController < ActionController::Base
  def authenticate_user!
    api_key = ApiKey.find_by(token: request.session[:token])
    @current_user = api_key&.bearer
    head :unauthorized if @current_user.nil?
  end
end
