class DropReplyAndCommentReplyTables < ActiveRecord::Migration[6.0]
  def up
    drop_table :replies
    drop_table :comment_replies
  end
  def down
    fail ActiveRecord::IrreversibleMigration #Since tables are no longer needed, no need to reverse (and recover data)
  end
end
