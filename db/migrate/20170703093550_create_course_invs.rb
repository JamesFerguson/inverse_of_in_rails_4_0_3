class CreateCourseInvs < ActiveRecord::Migration
  def change
    create_table :course_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
