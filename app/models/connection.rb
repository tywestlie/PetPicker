class Connection < ApplicationRecord
  validates_presence_of :status

  enum status: [:nope, :like, :match]

  belongs_to :adopter, class_name: 'User', foreign_key: 'adopter_id'
  belongs_to :pet
  has_many :messages, dependent: :delete_all

  def success
    puts "Created connection #{id} with status #{status} for pet #{pet.name} and user #{adopter.name}"
  end

  def failure
    puts "DID NOT SAVE connection #{id} with status #{status} for pet #{pet.name} and user #{adopter.name}"
  end

end
