class Comment < ApplicationRecord
  belongs_to :author_id, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post_id, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_columns

  def self.update_columns(post)
    post.increment!(:comments_counter)
  end
end
