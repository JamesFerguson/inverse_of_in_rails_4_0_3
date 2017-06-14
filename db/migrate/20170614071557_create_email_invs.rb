class CreateEmailInvs < ActiveRecord::Migration
  def change
    create_table :email_invs do |t|
      t.string :name
      t.references :user_inv, index: true

      t.timestamps
    end
  end
end
