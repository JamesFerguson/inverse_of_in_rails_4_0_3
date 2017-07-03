class CreateJoinTableChildrenParents < ActiveRecord::Migration
  def change
    create_join_table :children, :parents do |t|
      t.index [:child_id, :parent_id]
      t.index [:parent_id, :child_id]
    end
  end
end
