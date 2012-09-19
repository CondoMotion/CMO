class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :full_name, :owned_company_attributes
  # attr_accessible :title, :body
  validates :full_name, :presence => true
  has_many :memberships
  has_many :sites, :through => :memberships
  has_many :posts
  belongs_to :company
  has_one :owned_company, :class_name => "Company", :foreign_key => "owner_id"
  accepts_nested_attributes_for :owned_company

  def full_name
	  [first_name, last_name].join(' ')
	end

	def full_name=(name)
	  split = name.split(' ', 2)
	  self.first_name = split.first
	  self.last_name = split.last
	end
end
