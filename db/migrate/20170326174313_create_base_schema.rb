class CreateBaseSchema < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :level
      t.string :room_type
      t.string :dimension

      t.timestamps
    end

    create_table :
  end
end
