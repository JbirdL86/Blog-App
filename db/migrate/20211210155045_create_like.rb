class CreateLike < ActiveRecord::Migration[6.1]
  def change
    create_table :likes, &:timestamps
  end
end
