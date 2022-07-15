require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/nMuIXO5EEpM', bio: 'Teacher from Mexico.')

    @post = Post.new(title: 'Post Title', text: 'Post text', likes_counter: 2, comments_counter: 0, author_id: @user)
  end

  it 'should return likes_counter incremented by 1' do
    @post.save
    @like = Like.new(author_id: @user, post_id: @post)
    @like.save
    expect(@post.likes_counter).to eq(2)
  end
end
