class AddLockedToPerson < ActiveRecord::Migration
  def change
    add_column :people, :locked_at, :time
  end
end
