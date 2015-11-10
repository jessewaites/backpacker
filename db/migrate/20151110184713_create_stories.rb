class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
