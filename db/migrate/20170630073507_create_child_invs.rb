class CreateChildInvs < ActiveRecord::Migration
  def change
    create_table :child_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
