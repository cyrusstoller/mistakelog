class CreateRelationshipsMistakeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships_mistake_tags do |t|
      t.integer :mistake_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :relationships_mistake_tags, :mistake_id
    add_index :relationships_mistake_tags, :tag_id
  end
end
