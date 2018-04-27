class AddIndecesToUrl < ActiveRecord::Migration[5.0]
  def change
    add_index :urls, :shortened, unique: true
    add_index :urls, :customized_url, unique: true
  end
end
