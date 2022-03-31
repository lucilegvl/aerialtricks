class CreateTricks < ActiveRecord::Migration[6.1]
  def change
    create_table :tricks do |t|
      t.string :name
      t.string :person
      t.text :description
      t.integer :difficulty
      t.string :picture

      t.timestamps
    end
  end
end
