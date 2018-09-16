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
         LEFT OUTER JOIN connections ON connections.adopter_id = users.id
         LEFT OUTER JOIN pets ON connections.pet_id = pets.id
         WHERE pets.user_id = #{id} AND connections.status != 0
         GROUP BY users.id
         "
      )
    elsif role == 'adopter'
      Pet.find_by_sql(
        "SELECT pets.id, pets.name, pets.pic, pets.description
         FROM pets
         INNER JOIN connections ON connections.pet_id = pets.id
         WHERE connections.adopter_id = #{id} AND connections.status = 2
         GROUP BY pets.id "
      )
    end
  end
end
