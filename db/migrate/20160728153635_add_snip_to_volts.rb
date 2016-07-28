class AddSnipToVolts < ActiveRecord::Migration
  def change
    add_reference :volts, :snip, index: true, foreign_key: true
  end
end
