class CreateMistakes < ActiveRecord::Migration[5.2]
  def change
    create_table :mistakes do |t|
      t.integer :user_id
      t.text :description
      t.text :processed_description
      t.text :reflection
      t.text :processed_reflection
      t.integer :description_rating
      t.integer :reflection_rating
      t.date :reminder_date
      t.string :slug

      t.timestamps
    end
    add_index :mistakes, :slug, unique: true
    add_index :mistakes, :user_id
    add_index :mistakes, :description_rating
    add_index :mistakes, :reflection_rating
  end
end
