class CreateParentInvs < ActiveRecord::Migration
  def change
    create_table :parent_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
