class AddCountry < ActiveRecord::Migration
  def change
    add_column :developers, :country, :string
  end
end
