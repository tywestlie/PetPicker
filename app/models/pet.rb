class Pet < ApplicationRecord
  validates_presence_of :name

  belongs_to :user
  has_many :connections, dependent: :destroy

  def self.find_pets(id)
    find_by_sql("
      SELECT pets.* FROM pets
      LEFT OUTER JOIN connections on connections.pet_id=pets.id
      EXCEPT (SELECT pets.* from pets
        LEFT OUTER JOIN connections on connections.pet_id=pets.id
        WHERE connections.adopter_id = #{id} OR pets.user_id = #{id})
      LIMIT 10")
  end
end
