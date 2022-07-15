class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments, class_name: 'comment', foreign_key: 'post_id'
  belongs_to :author_id, class_name: 'User', foreign_key: 'author_id'

  after_save :updated_at_change

  def self.update_posts_counter(author_id)
    author_id.increment!(:posts_counter)
  end

  def self.recent_comments(comments)
    comments.order(created_at: :desc).limit(5)
  end
end
