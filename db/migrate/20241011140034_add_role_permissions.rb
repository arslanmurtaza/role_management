class AddRolePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :role_permissions do |t|
      t.references :user_role, null: false, foreign_key: true
      t.references :permission, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true
      t.boolean :enabled, default: false # Whether the permission is active or not
      t.timestamps
    end
  end
end
