class CreateAuthorInvs < ActiveRecord::Migration
  def change
    create_table :author_invs do |t|
      t.string :name

      t.timestamps
    end
  end
end
