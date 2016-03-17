class AddSidColumn < ActiveRecord::Migration
  def change
      add_column :instructors, :iid, :string
  end
end
