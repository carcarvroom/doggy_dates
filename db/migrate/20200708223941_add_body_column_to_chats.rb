class AddBodyColumnToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :body, :text
  end
end
