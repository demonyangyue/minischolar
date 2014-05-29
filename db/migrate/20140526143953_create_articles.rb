class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :article_attachment
      t.string :attachment
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
