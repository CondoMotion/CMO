class AddPermissionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :permission_id, :integer
  end
end
