class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

  def self.update_likes_counter(post)
    post.increment!(:likes_counter)
  end
end
