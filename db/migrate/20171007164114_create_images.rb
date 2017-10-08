class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.datetime :DateTime
      t.string :color
      t.time :response

      t.timestamps
    end
  end
end
