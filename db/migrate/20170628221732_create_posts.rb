class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :images#, Array: true, default: [] # add images as array
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
