class AddColumnToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :chat_id, :integer, defualt: nil
  end
end
