require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations For the Like model' do
    before(:each) do
      @user = User.create(name: 'Nuri', photo: 'image_link', bio: 'Developer from Macedonia')
      @post = Post.create(author: @user, title: 'My title', text: 'My text')
      @like = Like.create(author: @user, post_id: @post.id)
    end

    it 'if author_id is present' do
      @like.author_id = false
      expect(@like).not_to be_valid
    end

    it 'if post_id is present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'comment must be present' do
      expect(@post.likes.length).to eq 1
    end
  end
end
