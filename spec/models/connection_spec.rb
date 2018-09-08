require 'rails_helper'

RSpec.describe Connection, type: :model do
  describe "validations" do
    it {should validate_presence_of(:status)}
  end
  describe "relationships" do
    it {should belong_to(:adopter)}
    it {should belong_to(:pet)}
    it {should have_many(:messages)}
  end
end
