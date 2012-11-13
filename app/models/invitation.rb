class Invitation < ActiveRecord::Base
  attr_accessible :new, :recipient_email, :sender_id, :sent_at, :token
end
