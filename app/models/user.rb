class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :full_name
  # attr_accessible :title, :body
  validates :full_name, :presence => true

  def full_name
	  [first_name, last_name].join(' ')
	end

	def full_name=(name)
	  split = name.split(' ', 2)
	  self.first_name = split.first
	  self.last_name = split.last
	end
end
