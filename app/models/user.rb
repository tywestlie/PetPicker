class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_secure_password

  has_many :pets, dependent: :delete_all
  has_many :connections, class_name: 'Connection', foreign_key: 'adopter_id', dependent: :delete_all
  has_many :messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :delete_all

  enum role: [:default, :adopter, :owner, :admin]
  enum species_to_adopt: [:dog, :cat, :other]


  def save_with_key
    self.key = SecureRandom.urlsafe_base64
    save
  end

  def get_matches
    if role == 'owner'
      User.find_by_sql(
        "SELECT users.id, users.name, users.pic, users.description
         FROM users
         INNER JOIN connections ON connections.adopter_id = users.id
         INNER JOIN pets ON connections.pet_id = pets.id
         WHERE pets.user_id = #{id}
         GROUP BY users.id
         "
      )
    elsif role == 'adopter'

    end
  end
end
