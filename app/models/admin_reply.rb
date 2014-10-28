# == Schema Information
#
# Table name: admin_replies
#
#  id             :integer          not null, primary key
#  replyable_id   :integer
#  replyable_type :string(255)
#  content        :text
#  admin_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AdminReply < ActiveRecord::Base
  attr_accessible :content

  belongs_to :replyable, polymorphic: true
  belongs_to :admin, foreign_key: 'admin_id', class_name: 'AdminUser'
  
end
