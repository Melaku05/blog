require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'User' do
    before(:each) do
      @melaku = User.create!(
        name: 'melaku',
        photo: 'https://dummyimage.com/600x400/000/fff',
        bio: 'Lorem ipsum dolor sit amet',
        posts_counter: 0
      )

      @tom = User.create!(
        name: 'tom',
        photo: 'https://dummyimage.com/600x400/000/fff',
        bio: 'Lorem ipsum dolor sit amet',
        posts_counter: 0
      )

      visit root_path
    end

    it 'Shows the username' do
      expect(page).to have_content('melaku')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('https://dummyimage.com/600x400/000/fff')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end
  end
end
