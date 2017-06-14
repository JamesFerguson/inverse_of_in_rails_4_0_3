class CreateSentenceInvs < ActiveRecord::Migration
  def change
    create_table :sentence_invs do |t|
      t.integer :length
      t.references :criminal_inv, index: true
      t.references :prison_inv, index: true

      t.timestamps
    end
  end
end
