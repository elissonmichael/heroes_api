class Skill < ApplicationRecord
  ABILITIES = %w[strength dexterity constitution intelligence wisdom charisma]
              .freeze
  belongs_to :character
  validates :name, presence: true
  validates :ability, inclusion: {
    in: ABILITIES, message: "ability must be #{ABILITIES.join(' or ')}"
  }

  def score
    return score_modifier + character.proficiency_bonus if proficient

    score_modifier
  end

  private

  def score_modifier
    character.score_modifier(ability)
  end
end
