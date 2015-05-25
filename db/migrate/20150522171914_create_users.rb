class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_hash
      t.string :email
      t.integer :update_frequency
      t.string :alternate_homepage

      t.timestamps
    end
  end
end
