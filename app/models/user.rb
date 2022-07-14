class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.recent(max = 3)
    limit(max).order(created_at: :desc)
  end
end
