class RemoveColumnFromMatches < ActiveRecord::Migration[6.0]
  def change
    remove_column :matches, :chat_id
  end
end
