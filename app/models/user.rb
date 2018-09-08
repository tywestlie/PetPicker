class User < ApplicationRecord
  validates_presence_of :name
  has_many :pets, dependent: :delete_all
end
