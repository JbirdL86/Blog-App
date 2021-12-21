# frozen_string_literal: true

class AddUserRefToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :author, null: false, foreign_key: { to_table: :users }
  end
end
