class FormField < ApplicationRecord
  belongs_to :form
  has_many :responses, class_name: "FormResponse"
  has_many :options, class_name: "FormFieldOption"
end
