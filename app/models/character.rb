class Character < ApplicationRecord
  validates :name, presence: true
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom,
            :charisma, presence: true,
                       numericality: { greater_than_or_equal_to: 1,
                                       less_than_or_equal_to: 20 }

  def power
    abilities.sum / abilities.size.to_f
  end

  private

  def abilities
    [strength, dexterity, constitution, intelligence, wisdom, charisma]
  end
end
