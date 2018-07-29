class CreatePageTemplateVariableValues < ActiveRecord::Migration[5.2]
  def change
    create_table :page_template_variable_values do |t|
      t.integer :page_id
      t.integer :template_variable_id
      t.string :value

      t.timestamps
    end
  end
end
