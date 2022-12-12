class CreateRepliesFieldForCommentsTable < ActiveRecord::Migration[7.0]
    def change
        add_column :comments, :initial_comment, foreign_key: { to_table: :comments}, :references
    end
end
