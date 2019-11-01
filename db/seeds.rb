elisson = Character.create(
                      name: 'Elisson',
                      strength: 1,
                      constitution: 2,
                      dexterity: 3,
                      intelligence: 4,
                      wisdom: 2,
                      charisma: 3
                    )

elisson.skills.create(name: 'Athletics',  ability: 'strength', proficient: true)
elisson.skills.create(name: 'Acrobatics', ability: 'dexterity')
elisson.skills.create(name: 'Stealth',    ability: 'dexterity')

satya = Character.create(
          name: 'Satya',
          strength: 5,
          constitution: 6,
          dexterity: 7,
          intelligence: 8,
          wisdom: 8,
          charisma: 7
        )

satya.skills.create(name: 'Arcana',   ability: 'intelligence', proficient: true)
satya.skills.create(name: 'Religion', ability: 'intelligence')
satya.skills.create(name: 'History',  ability: 'intelligence')

krishynan = Character.create(
              name: 'Krishynan',
              strength: 9,
              constitution: 10,
              dexterity: 11,
              intelligence: 12,
              wisdom: 11,
              charisma: 10
            )

krishynan.skills.create(name: 'Investigation', ability: 'intelligence', proficient: true)
krishynan.skills.create(name: 'Nature',        ability: 'intelligence')
krishynan.skills.create(name: 'Persuasion',    ability: 'intelligence')

brandon = Character.create(
            name: 'Brandon',
            strength: 13,
            constitution: 15,
            dexterity: 14,
            intelligence: 15,
            wisdom: 13,
            charisma: 14
          )

brandon.skills.create(name: 'Medicine',   ability: 'wisdom', proficient: true)
brandon.skills.create(name: 'Perception', ability: 'wisdom')
brandon.skills.create(name: 'Survival',   ability: 'wisdom')

nyorai = Character.create(
          name: 'Nyorai',
          strength: 17,
          constitution: 18,
          dexterity: 19,
          intelligence: 20,
          wisdom: 19,
          charisma: 20
        )

nyorai.skills.create(name: 'Intimidation', ability: 'charisma', proficient: true)
nyorai.skills.create(name: 'Deception',    ability: 'charisma')
