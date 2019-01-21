class AddLabelToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :label, :string
  end
end
