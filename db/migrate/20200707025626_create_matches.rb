class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :matcher_id
      t.integer :matchee_id
      t.string :status

      t.timestamps
    end
  end
end
