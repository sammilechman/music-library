class AddColumnTitletoNotes < ActiveRecord::Migration
  def change
    add_column :notes, :title, :string, null: false
  end
end
