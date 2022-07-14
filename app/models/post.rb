class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  after_save :update_posts_counter

  def self.update_posts_counter(author)
    author.increment!(:posts_counter)
  end

  def self.recent_comments(comments)
    comments.order(created_at: :desc).limit(5)
  end
end
