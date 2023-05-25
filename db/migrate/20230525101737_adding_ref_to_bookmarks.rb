class AddingRefToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :list, foreign_key: true, null: false
    add_reference :bookmarks, :movie, foreign_key: true, null: false
  end
end
