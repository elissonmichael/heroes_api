class Skill < ApplicationRecord
    belongs_to :character
    validates :name, :ability, presence: true
end
