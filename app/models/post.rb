class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  after_save :update_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.increment!(:post_counter)
  end
end
