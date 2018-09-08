require 'rails_helper'

RSpec.describe User, type: :model do
  describe "vaildations" do
    it {should validate_presence_of(:name)}
  end
  describe "relationships" do
    it {should have_many(:pets)}
    it {should have_many(:connections)}
    it {should have_many(:messages)} #messages sent
  end
  
end
