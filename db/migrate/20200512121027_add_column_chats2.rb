class AddColumnChats2 < ActiveRecord::Migration[6.0]
  def change
            add_column :chats, :chat_email, :string
  end
end
