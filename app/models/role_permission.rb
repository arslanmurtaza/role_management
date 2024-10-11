class RolePermission < ApplicationRecord
  belongs_to :user_role
  belongs_to :resource
  belongs_to :permission
end
