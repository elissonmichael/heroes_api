require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
  end

  test 'score when character is not proficient' do
    assert_equal(-4, skills(:acrobatics).score)
  end

  test 'score when character is proficient' do
    assert_equal(-3, skills(:athletics).score)
  end
end
