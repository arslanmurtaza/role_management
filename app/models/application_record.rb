class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

# def has_permission?(resource_name, permission_name, parent_name = nil)
#   permission = Permission.find_by(name: permission_name)

#   # If there's a parent resource, find the resource by name and its parent
#   if parent_name
#     parent = Resource.find_by(name: parent_name)
#     resource = Resource.find_by(name: resource_name, parent: parent)
#   else
#     resource = Resource.find_by(name: resource_name)
#   end

#   # Return true if the role has the permission for this resource and parent
#   UserRole.first.role_permissions.exists?(resource: resource, permission: permission, enabled: true)
# end


# # Check permission at each level: Summary -> Overview -> Widget 5
# has_permission?('Summary', 'view') &&
# has_permission?('Overview', 'view', 'Summary') &&  # Pass parent name as 'Summary'
# has_permission?('Widget 5', 'view', 'Overview')    # Pass parent name as 'Overview'
