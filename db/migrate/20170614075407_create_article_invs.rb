class CreateArticleInvs < ActiveRecord::Migration
  def change
    create_table :article_invs do |t|
      t.string :name
      t.references :author_inv, index: true

      t.timestamps
    end
  end
end
