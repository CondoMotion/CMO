class CreateMemberships < ActiveRecord::Migration
  def change
  	create_table :memberships do |t|
      t.references :user, :site, :role
    end
    add_index :memberships, [:user_id, :site_id, :role_id]
  end
end
