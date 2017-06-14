class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :length
      t.references :criminal, index: true
      t.references :prison, index: true

      t.timestamps
    end
  end
end
