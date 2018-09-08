require 'rails_helper'

RSpec.describe User, type: :model do
  describe "vaildations" do
    it {should validate_presence_of(:name)}
  end
  describe "relationsships" do
    it {should have_many(:pets)}
  end
end
