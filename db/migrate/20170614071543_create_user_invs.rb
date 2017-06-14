class CreateUserInvs < ActiveRecord::Migration
  def change
    create_table :user_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
