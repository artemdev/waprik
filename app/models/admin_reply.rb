class AdminReply < ActiveRecord::Base
  attr_accessible :content

  belongs_to :replyable, polymorphic: true
  belongs_to :admin, foreign_key: 'admin_id', class_name: 'AdminUser'
  
end
