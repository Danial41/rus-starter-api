class ChangeDigestPasswordToPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :digest_password, :password_digest
  end
end
