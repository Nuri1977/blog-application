class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def update_posts_counter
    users = User.all
    users.each do |user|
      if(user.id == self.author_id)
        user.update_column(:posts_counter, user.posts.count)
      end
    end
  end

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).take(5)
  end

end
