class CreateVolts < ActiveRecord::Migration
  def change
    create_table :volts do |t|
      t.string :name
      t.references :members_id, index:true, foreign_key:true
      t.string :project_name
      t.string :default_licence
      t.references :snips_id, index:true, foreign_key: true

      t.timestamps null: false
    end
  end
end
