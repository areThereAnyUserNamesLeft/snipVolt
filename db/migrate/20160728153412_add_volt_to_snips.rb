class AddVoltToSnips < ActiveRecord::Migration
  def change
    add_reference :snips, :volt, index: true, foreign_key: true
  end
end
