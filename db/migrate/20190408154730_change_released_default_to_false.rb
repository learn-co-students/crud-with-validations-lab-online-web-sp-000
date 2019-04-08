class ChangeReleasedDefaultToFalse < ActiveRecord::Migration
  def change
    change_column_default :songs, :released, to: false
  end
end
