class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.string :occupation
      t.string :username

      t.timestamps
    end
  end
end
