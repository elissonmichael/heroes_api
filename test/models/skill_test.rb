require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:ability)
  end

  # test "the truth" do
  #   assert true
  # end
end
