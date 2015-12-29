class CreateConfigurators < ActiveRecord::Migration
  def change
    create_table :configurators do |t|
      t.string :name
      t.text   :datastore

      t.timestamps null: false
    end
  end
end
