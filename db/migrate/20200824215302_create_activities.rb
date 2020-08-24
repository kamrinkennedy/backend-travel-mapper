class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :cost
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
