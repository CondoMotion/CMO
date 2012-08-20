class Membership < ActiveRecord::Base
	attr_accessible :role_id, :site_id, :user_id
	belongs_to :user
	belongs_to :site
	belongs_to :role

end