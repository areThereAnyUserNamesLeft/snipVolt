class AddAuthorToVolts < ActiveRecord::Migration
  def change
    add_reference :volts, :author, index: true
    add_foreign_key :volts, :users, column: :author_id
  end
end
