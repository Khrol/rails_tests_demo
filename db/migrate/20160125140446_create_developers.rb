class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string  :name
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
