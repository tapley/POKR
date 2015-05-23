class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.belongs_to :keyresult
      t.integer :prev_value

      t.timestamps
    end
  end
end
