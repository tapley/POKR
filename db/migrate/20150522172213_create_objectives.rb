class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.belongs_to :user
      t.text :description
      t.date :due

      t.timestamps
    end
  end
end
