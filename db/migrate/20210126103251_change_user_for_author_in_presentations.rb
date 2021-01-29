class ChangeUserForAuthorInPresentations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :presentations, :user
    add_reference :presentations, :author, index: true
    add_foreign_key :presentations, :users, column: :author_id
  end
end
