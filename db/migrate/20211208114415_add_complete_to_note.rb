class AddCompleteToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :complete, :boolean
  end
end
