class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :platform
      t.string :genre
      t.string :company
      t.string :image
      t.string :title
      t.text :content
      t.date :release_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
