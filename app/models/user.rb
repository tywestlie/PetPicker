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

  def matches
    if role == 'owner'
      results = owner_connections
      format_connection_fields(results)
    elsif role == 'adopter'
      adopter_connections
    end
  end

  private

  def owner_connections
    Connection.find_by_sql(
      "SELECT connections.id, pets.name AS pet_name, users.name AS user_name, users.pic, users.description
      FROM users
      LEFT OUTER JOIN connections ON connections.adopter_id = users.id
      LEFT OUTER JOIN pets ON connections.pet_id = pets.id
      WHERE pets.user_id = #{id} AND connections.status != 0
      GROUP BY connections.id, pets.id, users.id"
    )
  end

  def format_connection_fields(connections)
    connections.map do |conn|
      conn.description = "..." if conn.description.nil?
      conn.pic = placeholder_image if conn.pic.nil?
      {id: conn.id, name: "#{conn.user_name} likes #{conn.pet_name}", pic: conn.pic, description: conn.description, owner: true}
    end
  end

  def adopter_connections
    Pet.find_by_sql(
      "SELECT pets.id, pets.name, pets.pic, pets.description
      FROM pets
      INNER JOIN connections ON connections.pet_id = pets.id
      WHERE connections.adopter_id = #{id} AND connections.status = 2
      GROUP BY pets.id"
    )
  end

  def placeholder_image
    'https://upload.wikimedia.org/wikipedia/commons/d/d5/Placeholder_female_superhero_c.png'
  end
end
