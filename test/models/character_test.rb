require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    %i[strength dexterity constitution intelligence wisdom charisma]
      .each do |ability|
        should validate_presence_of(ability)
        should validate_numericality_of(ability).is_greater_than_or_equal_to(1)
                                                .is_less_than_or_equal_to(20)
      end
  end

  test 'level is the average of abilities' do
    assert_equal 2,  characters(:elisson).level
    assert_equal 6,  characters(:satya).level
    assert_equal 10, characters(:krishynan).level
    assert_equal 14, characters(:brandon).level
    assert_equal 18, characters(:nyorai).level
  end

  test 'proficiency_bonus is based on the level' do
    assert_equal 2, characters(:elisson).proficiency_bonus
    assert_equal 3, characters(:satya).proficiency_bonus
    assert_equal 4, characters(:krishynan).proficiency_bonus
    assert_equal 5, characters(:brandon).proficiency_bonus
    assert_equal 6, characters(:nyorai).proficiency_bonus
  end
end
