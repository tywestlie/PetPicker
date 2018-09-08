class Pet < ApplicationRecord
  validates_presence_of :name

  belongs_to :user
  has_many :connections
end
