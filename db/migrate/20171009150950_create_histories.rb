class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.float :response
      t.string :color
      t.string :noun

      t.timestamps
    end
  end
end
