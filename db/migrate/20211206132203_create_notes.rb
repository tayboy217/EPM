class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :word
      t.text :japanese
      t.text :english

      t.timestamps
    end
  end
end
