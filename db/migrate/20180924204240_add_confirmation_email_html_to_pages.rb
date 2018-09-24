class AddConfirmationEmailHtmlToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :confirmation_email_html, :text
  end
end
