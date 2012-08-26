class Post < ActiveRecord::Base
  belongs_to :post_type
  belongs_to :site
  attr_accessible :attachment, :content, :title, :site_id, :post_type_id
  mount_uploader :attachment, AttachmentUploader
end
