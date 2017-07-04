class CreateTeachingAssistantInvs < ActiveRecord::Migration
  def change
    create_table :teaching_assistant_invs do |t|
      t.string :name
      t.references :teachable_inv, polymorphic: true, index: {:name => "index_teach_asst_invs_on_teachable_inv_id_n_teachable_inv_type"}

      t.timestamps
    end
  end
end
