class AddColumnMessages2 < ActiveRecord::Migration[6.0]
  def change
            add_column :messages, :content, :string
  end
end
