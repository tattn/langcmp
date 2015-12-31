class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :category, null: false
      t.string :title, null: false
      t.string :source, null: false
      t.string :language, null: false

      t.timestamps null: false
    end
  end
end
