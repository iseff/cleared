class AddStepToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :step, :integer
  end
end
