# db/seeds.rb

# Clear existing data
RolePermission.delete_all
Permission.delete_all
Resource.delete_all
UserRole.delete_all

# Create Roles
worker_role = UserRole.create(name: "Worker")

# Create Resources (Sections, Tabs, Widgets)
nav_section1 = Resource.create(name: "Nav Section 1", resource_type: "section", collapsible: true)
nav_section2 = Resource.create(name: "Nav Section 2", resource_type: "section", collapsible: true)
nav_section3 = Resource.create(name: "Nav Section 3", resource_type: "section", collapsible: true)
nav_section4 = Resource.create(name: "Nav Section 4", resource_type: "section", collapsible: true)

# Tabs under Nav Section 4
screen_tab1 = Resource.create(name: "Screen Tab 1", resource_type: "tab", parent: nav_section4, collapsible: true)
screen_tab2 = Resource.create(name: "Screen Tab 2", resource_type: "tab", parent: nav_section4, collapsible: true)
screen_tab3 = Resource.create(name: "Screen Tab 3", resource_type: "tab", parent: nav_section4, collapsible: true)

# Summary Tab and Widgets
summary_section = Resource.create(name: "Summary", resource_type: "section", collapsible: true)
summary_widget_section = Resource.create(name: "Widgets", resource_type: "section_item", parent: summary_section)

widget1 = Resource.create(name: "Widget 1", resource_type: "widget", parent: summary_widget_section)
widget3 = Resource.create(name: "Widget 3", resource_type: "widget", parent: summary_widget_section)
widget4 = Resource.create(name: "Widget 4", resource_type: "widget", parent: summary_widget_section)
widget5 = Resource.create(name: "Widget 5", resource_type: "widget", parent: summary_widget_section)
widget6 = Resource.create(name: "Widget 6", resource_type: "widget", parent: summary_widget_section)
widget_6_action = Resource.create(name: "Widget 6 Download", resource_type: "action", parent: widget6)

# Nested Screen Tabs inside Summary
overview_tab = Resource.create(name: "Overview", resource_type: "tab", parent: summary_section, collapsible: true)
overview_widget_section = Resource.create(name: "Widgets", resource_type: "section_item", parent: overview_tab)
overview_action_section = Resource.create(name: "Actions", resource_type: "section_item", parent: overview_tab)

# Sub-widgets within Overview
overview_widget1 = Resource.create(name: "Widget 1", resource_type: "widget", parent: overview_widget_section)
overview_widget3 = Resource.create(name: "Widget 3", resource_type: "widget", parent: overview_widget_section)
overview_widget4 = Resource.create(name: "Widget 4", resource_type: "widget", parent: overview_widget_section)
overview_widget5 = Resource.create(name: "Widget 5", resource_type: "widget", parent: overview_widget_section)

# Actions for Widgets
download_csv = Resource.create(name: "Download CSV", resource_type: "action", parent: overview_action_section)

# Additional Sections under Summary
pharmacy_tab = Resource.create(name: "Pharmacy", resource_type: "tab", parent: summary_section, collapsible: true)
medical_tab = Resource.create(name: "Medical", resource_type: "tab", parent: summary_section, collapsible: true)


# Create Permissions (View, Download, etc.)
view_permission = Permission.create(name: "view", description: "Can view the resource")
edit_permission = Permission.create(name: "edit", description: "Can edit the resource")
download_permission = Permission.create(name: "download", description: "Can download the resource")

# Assign Permissions to Worker Role for each Resource

# Nav Sections
RolePermission.create(user_role: worker_role, resource: nav_section1, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: nav_section2, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: nav_section3, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: nav_section4, permission: view_permission, enabled: true)

# Screen Tabs in Nav Section 4
RolePermission.create(user_role: worker_role, resource: screen_tab1, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: screen_tab2, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: screen_tab3, permission: view_permission, enabled: true)

# Summary Section and its Widgets
RolePermission.create(user_role: worker_role, resource: summary_section, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: widget1, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: widget3, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: widget4, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: widget5, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: widget6, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: widget_6_action, permission: download_permission, enabled: true)


# Overview Tab and its Widgets
RolePermission.create(user_role: worker_role, resource: overview_tab, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: overview_widget1, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: overview_widget3, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: overview_widget4, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: overview_widget5, permission: view_permission, enabled: true)

# Actions (Download CSV)
RolePermission.create(user_role: worker_role, resource: download_csv, permission: download_permission, enabled: true)

# Pharmacy and Medical Tabs
RolePermission.create(user_role: worker_role, resource: pharmacy_tab, permission: view_permission, enabled: true)
RolePermission.create(user_role: worker_role, resource: medical_tab, permission: view_permission, enabled: true)
