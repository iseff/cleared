class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :url
      t.integer :template_id

      t.timestamps
    end
  end
end
