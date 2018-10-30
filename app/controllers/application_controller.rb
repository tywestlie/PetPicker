class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # before_action :authenticate_token

  def authenticate_user(user, pass)
    if user && user.authenticate(pass)
      render json: user
    else
      render json: { 'message': 'login failed' }, status: 404
    end
  end

  def authenticate_role(user, role)
    if role  == 'owner'
      user.role = 'owner'
    else
      user.role = 'adopter'
    end
  end

  def authenticate_token
    user = User.find(params['id'])
    actual_token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    params['token'] == actual_token
  end

  private

  def record_not_found
    render json: {message: 'Not Found'}, status: 404
  end

  def invalid_token
    render json: {message: 'invalid token'}, status: 400
  end

  def validate_token
    return invalid_token unless authenticate_token
  end
end
