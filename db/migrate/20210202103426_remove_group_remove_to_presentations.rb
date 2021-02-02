class RemoveGroupRemoveToPresentations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :presentations, :group, index: true, foreign_key: true

    create_table :presentations_groups, id: false do |t|
      t.belongs_to :presentation
      t.belongs_to :group
    end
  end
end
