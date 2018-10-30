class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def authenticate_user(user, pass)
    if user && user.authenticate(pass)
      render json: user
    else
      render json: { "message": "login failed" }, status: 404
    end
  end

  def authenticate_role(user, role)
    if role  == "owner"
      user.role = "owner"
    else
      user.role = "adopter"
    end
  end

  def authenticate_token(id, token)
    user = User.find(id)
    actual_token = JWT.encode user.id, Rails.application.secret_key_base, 'HS256'
    token == actual_token
  end

private
  def record_not_found
    render json: {message: "Not Found"}, status: 404
  end
end
