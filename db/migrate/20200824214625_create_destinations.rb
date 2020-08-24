class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :location
      t.string :locale
      t.date :arrival
      t.date :departure

      t.timestamps
    end
  end
end
