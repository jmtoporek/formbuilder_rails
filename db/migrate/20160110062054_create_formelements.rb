class CreateFormelements < ActiveRecord::Migration
  def change
    create_table :formelements do |t|
      t.string :name
      t.integer :configurator_id
      t.string :type
      t.string :label
      t.text :datastore
      
      t.timestamps null: false
    end
  end
end
