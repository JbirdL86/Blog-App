# frozen_string_literal: true

class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text

      t.timestamps
    end
  end
end
