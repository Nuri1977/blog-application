class Comment < ApplicationRecord
  after_save :increment_comments_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  private

  def increment_comments_counter
    post.increment!(:comments_counter)
  end
end
