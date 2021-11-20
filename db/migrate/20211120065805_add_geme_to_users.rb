class AddGemeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :geme, :string
  end
end
