class AddPlaceholderToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :placeholder, :string
  end
end
