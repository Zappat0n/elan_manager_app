class AddNameToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :name, :string
  end
end
