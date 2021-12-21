# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :author_id
  after_save :update_likes_count

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
