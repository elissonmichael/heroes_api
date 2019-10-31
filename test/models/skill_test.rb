require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  context 'validations' do
    should belong_to(:character)
    should validate_presence_of(:name)
    abilities = %w[strength dexterity constitution intelligence wisdom charisma]
    should validate_inclusion_of(:ability).in_array(abilities)
  end

  test 'score when character is not proficient' do
    assert_equal(-4, skills(:acrobatics).score)
    assert_equal(-4, skills(:stealth).score)
    assert_equal(-1, skills(:religion).score)
    assert_equal(-1, skills(:history).score)
    assert_equal  1, skills(:nature).score
    assert_equal  0, skills(:persuasion).score
    assert_equal  1, skills(:perception).score
    assert_equal  1, skills(:survival).score
    assert_equal  5, skills(:deception).score
  end

  test 'score when character is proficient' do
    assert_equal(-3, skills(:athletics).score)
    assert_equal  2, skills(:arcana).score
    assert_equal  5, skills(:investigation).score
    assert_equal  6, skills(:medicine).score
    assert_equal  11, skills(:intimidation).score
  end
end
