class CreateJoinTableChildInvsParentInvs < ActiveRecord::Migration
  def change
    create_join_table :child_invs, :parent_invs do |t|
      t.index [:child_inv_id, :parent_inv_id]
      t.index [:parent_inv_id, :child_inv_id]
    end
  end
end
