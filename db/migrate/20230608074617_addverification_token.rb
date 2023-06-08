class AddverificationToken < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :verification_token, :string
  end
end
