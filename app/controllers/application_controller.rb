class ApplicationController < ActionController::API
  respond_to :json

  def new_session_path(scope)
    new_user_session_path
  end
end
