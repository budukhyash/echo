class CreateEndpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :endpoints do |t|
      t.string :category
      t.string :path
      t.integer :verb
      t.json :response
      t.timestamps
    end
  end
end
