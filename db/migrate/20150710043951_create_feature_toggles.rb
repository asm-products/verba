class CreateFeatureToggles < ActiveRecord::Migration
  def change
    create_table :feature_toggles do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
