class CreateDenominations < ActiveRecord::Migration
  def change
    create_table :denominations do |t|
      t.string :name
      t.decimal :value

      t.timestamps null: false
    end
  end
end
