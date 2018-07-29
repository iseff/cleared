class CreateTemplateVariables < ActiveRecord::Migration[5.2]
  def change
    create_table :template_variables do |t|
      t.string :key_name
      t.string :default_value

      t.timestamps
    end
  end
end
