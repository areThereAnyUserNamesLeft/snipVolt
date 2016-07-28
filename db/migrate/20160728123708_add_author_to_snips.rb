class AddAuthorToSnips < ActiveRecord::Migration
  def change
    add_reference :snips, :author, index: true
    add_foreign_key :snips, :users, column: :author_id
  end
end
