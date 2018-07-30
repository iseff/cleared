class RemoveUrlFromForms < ActiveRecord::Migration[5.2]
  def change
    remove_column :forms, :url, :string
  end
end
