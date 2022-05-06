require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    before(:each) do
      @user = User.new(name: 'Nuri', photo: 'photo_link', bio: 'my bio')
    end

    before { @user.save }

    it 'name must not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'post counter must be an integer' do
      @user.posts_counter = 'hello'
      expect(@user).to_not be_valid
    end

    it 'should have 0 posts' do
      expect(@user.recent_posts.length).to eq 0
    end
  end
end
