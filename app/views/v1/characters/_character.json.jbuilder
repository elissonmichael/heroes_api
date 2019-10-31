json.extract! character, :id, :name, :strength, :dexterity, :constitution,
                         :intelligence, :wisdom, :charisma, :level,
                         :proficiency_bonus

json.skills character.skills, partial: 'v1/skills/skill', as: :skill
