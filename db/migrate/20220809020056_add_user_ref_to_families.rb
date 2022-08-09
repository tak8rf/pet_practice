class AddUserRefToFamilies < ActiveRecord::Migration[6.1]
  def change
    add_reference :families, :user, null: false, foreign_key: true
  end
end
