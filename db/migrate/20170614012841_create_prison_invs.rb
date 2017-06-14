class CreatePrisonInvs < ActiveRecord::Migration
  def change
    create_table :prison_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
