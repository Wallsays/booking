class RenameDefaults < ActiveRecord::Migration
  def self.up
    rename_table :defaults, :inventory_templates
  end

 def self.down
    rename_table :inventory_templates, :defaults
 end
end
