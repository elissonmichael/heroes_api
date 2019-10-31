class Character < ApplicationRecord
  validates :name, presence: true
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom,
            :charisma, presence: true,
                       numericality: { greater_than_or_equal_to: 1,
                                       less_than_or_equal_to: 20 }
  has_many :skills

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

  def score_modifier(ability)
    case send(ability)
    when 1      then -5
    when 2..3   then -4
    when 4..5   then -3
    when 6..7   then -2
    when 8..9   then -1
    when 10..11 then  0
    when 12..13 then  1
    when 14..15 then  2
    when 16..17 then  3
    when 18..19 then  4
    when 20..21 then  5
    end
  end

  private

  def abilities
    [strength, dexterity, constitution, intelligence, wisdom, charisma]
  end
end
