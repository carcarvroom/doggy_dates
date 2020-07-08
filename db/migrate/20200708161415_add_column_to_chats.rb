class AddColumnToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :match_id, :integer
  end
end
