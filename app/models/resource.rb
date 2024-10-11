class Resource < ApplicationRecord
  has_many :role_permissions
  belongs_to :parent, class_name: 'Resource', optional: true
  has_many :children, class_name: 'Resource', foreign_key: 'parent_id'

  def self.tree_structure(parent = nil)
    resources = where(parent: parent).includes(:children)
    resources.map do |resource|
      {
        id: resource.id,
        name: resource.name,
        children: tree_structure(resource), # Recursively get children
        collapsible: resource.collapsible
      }
    end
  end
end
