class CreateSnips < ActiveRecord::Migration
  def change
    create_table :snips do |t|
      t.string :snipOwner
      t.string :name
      t.string :language
      t.string :description
      t.string :summary
      t.string :readme
      t.string :licence
      t.string :volt
      t.string :voltOwner
      t.string :code

      t.timestamps null: false
    end
  end
end
