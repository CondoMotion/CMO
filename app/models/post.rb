class Post < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  attr_accessible :attachment, :content, :title, :site_id, :post_type_id, :permission_id
  mount_uploader :attachment, AttachmentUploader

  def self.search(search)
	  if search
	    find(:all, :conditions => ['title LIKE ? or content LIKE ?', "%#{search}%", "%#{search}%"])
	  else
	    find(:all)
	  end
	end

end
