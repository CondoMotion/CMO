class Site < ActiveRecord::Base
  attr_accessible :address, :description, :name, :subdomain
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :posts
  validates :subdomain, :uniqueness => true
end
