class PageTemplateVariableValue < ApplicationRecord
  belongs_to :page
  belongs_to :template_variable
end
