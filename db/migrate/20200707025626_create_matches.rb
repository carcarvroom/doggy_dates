class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :matcher
      t.integer :matchee
      t.string :status
      t.integer :chat_id 

      t.timestamps
    end
  end
end
