class Page < ApplicationRecord
  belongs_to :template
  has_many :variable_values, class_name: 'PageTemplateVariableValue'

end
