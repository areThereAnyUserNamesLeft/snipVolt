class ChangeVoltColumnName < ActiveRecord::Migration
  def change
      rename_column :snips, :volt, :volt_name
  end
end
