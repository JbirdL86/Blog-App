class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  after_save :update_comments_count
  default_scope { includes(:likes) }

  private

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
