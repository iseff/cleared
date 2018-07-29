class AddTemplateIdToTemplateVariables < ActiveRecord::Migration[5.2]
  def change
    add_column :template_variables, :template_id, :integer
  end
end
