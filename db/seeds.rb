first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is first post')
second_post = Post.create(author: first_user, title: 'Hello', text: 'This issecond post')
third_post = Post.create(author: second_user, title: 'Hello', text: 'This isthird post')
fourth_post = Post.create(author: second_user, title: 'Hello', text: 'This is fourth post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!' )
Comment.create(post: second_post, author: second_user, text: 'Hi , this is my first comment' )
Comment.create(post: second_post, author: second_user, text: 'Hi , this is my second comment' )

Like.create(post: first_post, author: second_user)
Like.create(post: second_post, author: first_user)

puts 'Seed data loaded successfully'
