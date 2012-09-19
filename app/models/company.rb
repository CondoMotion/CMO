class Company < ActiveRecord::Base
  attr_accessible :address, :city, :name, :owner_id, :phone, :state, :zip
  has_many :sites
  belongs_to :company_owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :managers, :class_name => "User"

  validates_presence_of :name
end
