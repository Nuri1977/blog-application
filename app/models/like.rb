class Like < ApplicationRecord
  after_save :increment_likes_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  private
  
  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
