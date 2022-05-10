first_user = User.create(email: 'test@email.com', password: 'password', name: 'Tom', photo: 'https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-600w-542759665.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(email: 'test1@email.com', password: 'password', name: 'Lilly', photo: 'https://image.shutterstock.com/image-vector/female-face-avatar-on-white-600w-562359607.jpg', bio: 'Teacher from Poland.')

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
