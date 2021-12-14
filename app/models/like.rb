class Like < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :author_id

  def update_likes_count
    post.update(likes_counter: post.likes.count)
  end
end
