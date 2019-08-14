class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :user_id
      t.string :name
      t.integer :cached_count, default: 0

      t.timestamps
    end
    add_index :tags, :user_id
    add_index :tags, :name
    add_index :tags, :cached_count
  end
end
