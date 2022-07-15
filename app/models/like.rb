class Like < ApplicationRecord
  belongs_to :author_id, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post_id, class_name: 'Post', foreign_key: 'post_id'

  after_save :updated_at_change

  def self.updated_at_change(post_id)
    post_id.increment!(:likes_counter)
  end
end
