class Character < ApplicationRecord
  validates_presence_of :name, :strength, :dexterity, :constitution,
                        :intelligence, :wisdom, :charisma
end
