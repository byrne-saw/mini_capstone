class ChangeImageurlToText < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :image_url, :text
  end
end
