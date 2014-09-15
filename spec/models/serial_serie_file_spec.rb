# == Schema Information
#
# Table name: serial_serie_files
#
#  id         :integer          not null, primary key
#  serie_id   :integer
#  quality_id :integer
#  format_id  :integer
#  attach     :string(255)
#  size       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  downloads  :integer          default(0)
#

require 'spec_helper'

describe SerialSerieFile do
  pending "add some examples to (or delete) #{__FILE__}"
end
