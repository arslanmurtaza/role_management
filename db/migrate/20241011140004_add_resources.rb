class AddResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.references :parent, foreign_key: { to_table: :resources } # Self-referencing for hierarchy
      t.string :resource_type # e.g., 'section', 'tab', 'widget', etc.
      t.boolean :collapsible, default: false
      t.timestamps
    end
  end
end
