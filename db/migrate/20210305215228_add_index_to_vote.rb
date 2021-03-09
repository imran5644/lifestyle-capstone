class AddIndexToVote < ActiveRecord::Migration[6.1]
  def change
    add_index :votes, %i[user_id article_id], unique: true
  end
end
