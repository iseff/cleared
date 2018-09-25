class AddTrackableToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :trackable, :boolean
  end
end
