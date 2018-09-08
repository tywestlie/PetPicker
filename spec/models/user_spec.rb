require 'rails_helper'

RSpec.describe User, type: :model do
  describe "vaildations" do
    it {should validate_presence_of(:name)}
  end
end
