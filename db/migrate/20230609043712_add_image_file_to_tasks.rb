class AddImageFileToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :image_file, :string
  end
end
