class ReimagineCommentsTable < ActiveRecord::Migration[6.0]
  def up
    remove_columns(:comments, :user_id, :picture_id, :comment_reply_id)
  end
  def down
    fail ActiveRecord::IrreversibleMigration #Since columns are no longer needed, no need to reverse (and recover data)
  end
end
