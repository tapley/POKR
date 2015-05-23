class CreateKeyresults < ActiveRecord::Migration
  def change
    create_table :keyresults do |t|
      t.belongs_to :objective
      t.integer :number
      t.string :unit
      t.string :action

      t.timestamps
    end
  end
end
