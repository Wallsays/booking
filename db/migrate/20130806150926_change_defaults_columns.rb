class ChangeDefaultsColumns < ActiveRecord::Migration
  def change
    rename_column :defaults, :time, :start_time
    add_column :defaults, :end_time, :time
  end
end
