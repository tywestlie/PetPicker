class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def validate_token
    return invalid_token unless authenticate_token
  end

  def authenticate_token
    user = User.find(params['id'])
    token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    params['token'] == token
  end

  def invalid_token
    render json: { message: 'invalid token' }, status: 400
  end

  def record_not_found
    render json: { message: 'Not Found' }, status: 404
  end

  def login_failure
    render json: { message: 'login failed' }, status: 400
  end
end
