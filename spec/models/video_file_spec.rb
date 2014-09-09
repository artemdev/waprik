# == Schema Information
#
# Table name: video_files
#
#  id         :integer          not null, primary key
#  video_id   :integer
#  quality_id :integer
#  format_id  :integer
#  size       :integer
#  attach     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe VideoFile do
  pending "add some examples to (or delete) #{__FILE__}"
end
