class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
