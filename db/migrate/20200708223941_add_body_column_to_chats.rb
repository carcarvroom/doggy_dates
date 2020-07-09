class AddBodyColumnToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :body, :text
    add_column :chats, :user_id, :integer
  end
end
