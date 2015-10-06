class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.references :series, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
