class ChangeFormFieldsTypeToInputType < ActiveRecord::Migration[5.2]
  def change
    rename_column :form_fields, :type, :input_type
  end
end
