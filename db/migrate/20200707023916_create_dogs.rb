class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.integer :user_id
      t.string :name
      t.integer :age
      t.string :breed
      t.string :size
      t.string :bio
      t.string :image_url

      t.timestamps
    end
  end
end
