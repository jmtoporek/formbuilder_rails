class CreateConfigurators < ActiveRecord::Migration
  def change
    create_table :configurators do |t|
      t.string  :name
      t.string  :key
      t.string  :slug
      t.integer :user_id
      t.text    :datastore

      t.timestamps null: false
    end
  end
end
