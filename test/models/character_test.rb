require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  context '#power' do
    def return_average_of_abilities
      assert_in_delta characters(:elisson).power, 6.66, 0.01
      assert_in_delta characters(:satya).power,   7.33, 0.01
    end
  end

  context 'validations' do
    should validate_presence_of(:name)
    [:strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma]
    .each do |ability|
       should validate_presence_of(ability)
       should validate_numericality_of(ability).is_greater_than_or_equal_to(1)
                                               .is_less_than_or_equal_to(20)

     end
  end
end
