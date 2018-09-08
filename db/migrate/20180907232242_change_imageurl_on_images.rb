class ChangeImageurlOnImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :prodcut_id, :product_id
  end
end
