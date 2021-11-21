class AddPcidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pcid, :string
  end
end
