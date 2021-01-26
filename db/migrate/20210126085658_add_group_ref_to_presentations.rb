class AddGroupRefToPresentations < ActiveRecord::Migration[6.1]
  def change
    add_reference :presentations, :group, foreign_key: true
  end
end
