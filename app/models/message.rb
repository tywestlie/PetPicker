class Message < ApplicationRecord
  validates_presence_of :body
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :connection
end
