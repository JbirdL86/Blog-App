# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
              { name: 'Nelsino', photo: 'Cool_Photo_1', bio: "I'm the last oracle", post_counter: 0 },
              { name: 'Hamza', photo: 'Cool_Photo_1', bio: "I'm the First oracle", post_counter: 0 },
              { name: 'Juan', photo: 'Cool_Photo_1', bio: "I'm the Best oracle", post_counter: 0 },
              { name: 'Mateo', photo: 'Cool_Photo_1', bio: "I'm the Crazy oracle", post_counter: 0 },
              { name: 'Laylo', photo: 'Cool_Photo_1', bio: "I'm the sleepy oracle", post_counter: 0 },
              { name: 'Herbert', photo: 'Cool_Photo_1', bio: "I'm the rider oracle", post_counter: 0 }
            ])

all_users = User.all

all_users.each do |user|
  (1..5).each do |j|
    Post.create(title: "Post number: #{j}", text: "I'm writing my post number: #{j}", comments_counter: 0,
                likes_counter: 0, author_id: user.id)
  end
end

all_posts = Post.all

all_posts.each do |post|
  (1..5).each do |j|
    Like.create(author_id: all_users[j].id, post_id: post.id)
    Comment.create(author_id: all_users[j].id, post_id: post.id,
                   text: "I'm #{all_users[j].name} and I'm commenting gibberish here.")
  end
end
