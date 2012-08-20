class Site < ActiveRecord::Base
  attr_accessible :address, :description, :name, :subdomain
  has_many :memberships
  has_many :users, :through => :memberships
end
