class AddRefToModels < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :posts_counter, order: {posts_counter: :desc}
    add_reference :posts, :author, foreign_key: {to_table: :users}
    add_index :posts, :comments_counter, order: {comments_counter: :desc}
    add_reference :likes, :post, foreign_key: {to_table: :posts}
    add_reference :likes, :author, foreign_key: {to_table: :users}
    add_reference :comments, :post, foreign_key: {to_table: :posts}
    add_reference :comments, :author, foreign_key: {to_table: :users}
  end
end
