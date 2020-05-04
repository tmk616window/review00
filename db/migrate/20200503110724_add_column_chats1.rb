class AddColumnChats1 < ActiveRecord::Migration[6.0]
  def change
            add_column :chats, :task_id, :integer
            add_reference :chats, :channel, foreign_key: true
  end
end
