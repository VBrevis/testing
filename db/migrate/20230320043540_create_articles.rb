class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :lead
      t.string :author
      t.text :body
      t.text :url_img

      t.timestamps
    end
  end
end
