class FixUserPasswordColumn < ActiveRecord::Migration[8.0]
  def up
    add_column :users, :password_digest, :string unless column_exists?(:users, :password_digest)
    remove_column :users, :encrypted_password if column_exists?(:users, :encrypted_password)
    change_column_null :users, :password_digest, false
  end

  def down
    add_column :users, :encrypted_password, :string unless column_exists?(:users, :encrypted_password)
    remove_column :users, :password_digest if column_exists?(:users, :password_digest)
  end
end
