class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :species_to_adopt, :role, :pic, :description, :token

  def token
    JWT.encode object.id, Rails.application.secret_key_base, 'HS256'
  end
end
