class AddIndexOnIdeasTitle < ActiveRecord::Migration[5.0]
  def change
    add_index :ideas, :title
  end
end
