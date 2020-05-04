class AddColumnChats4 < ActiveRecord::Migration[6.0]
  def change
            add_column :chats, :chat_post_id, :integer
  end
end
