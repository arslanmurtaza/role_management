class UserRole < ApplicationRecord
  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  has_many :resources, through: :role_permissions
end