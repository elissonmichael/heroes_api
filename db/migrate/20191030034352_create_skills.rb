class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :ability
      t.integer :character_id
      t.boolean :proficient
      t.timestamps
    end
  end
end
