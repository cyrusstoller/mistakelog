class AddIndexForReminderDate < ActiveRecord::Migration[5.2]
  def change
    add_index :mistakes, :reminder_date
  end
end
