class Connection < ApplicationRecord
  validates_presence_of :status

  belongs_to :adopter, class_name: 'User', foreign_key: 'adopter_id'
  belongs_to :pet
  has_many :messages, dependent: :delete_all
end
