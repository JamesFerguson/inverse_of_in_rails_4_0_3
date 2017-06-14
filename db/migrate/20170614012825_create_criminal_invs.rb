class CreateCriminalInvs < ActiveRecord::Migration
  def change
    create_table :criminal_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
