class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.string :title
      t.decimal :price, :decimal, :precision => 15, :scale => 2

      t.timestamps
    end
  end
end
