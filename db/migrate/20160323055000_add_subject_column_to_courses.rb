class AddSubjectColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :subjects, :string
  end
end
