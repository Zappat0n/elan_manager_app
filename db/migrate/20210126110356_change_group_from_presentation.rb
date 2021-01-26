class ChangeGroupFromPresentation < ActiveRecord::Migration[6.1]
  def change
    change_column_null :presentations, :group_id, true
  end
end
