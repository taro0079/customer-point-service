class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :point

      t.timestamps
    end
  end
end
