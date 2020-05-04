class AddColumnChannels < ActiveRecord::Migration[6.0]
  def change
            add_column :channels, :task_id, :integer
  end
end
