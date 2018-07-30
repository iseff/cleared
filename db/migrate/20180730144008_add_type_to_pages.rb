class AddTypeToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :type, :string
  end
end
