class Character < ApplicationRecord
  validates :name, presence: true
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom,
            :charisma, presence: true,
                       numericality: { greater_than_or_equal_to: 1,
                                       less_than_or_equal_to: 20 }

  def level
    abilities.sum / abilities.size
  end

  def proficiency_bonus
    case level
      when 1..4   then 2
      when 5..8   then 3
      when 9..12  then 4
      when 13..16 then 5
      when 17..20 then 6
    end
  end

  private

  def abilities
    [strength, dexterity, constitution, intelligence, wisdom, charisma]
  end
end
