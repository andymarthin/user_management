# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  file_data  :text
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Report < ApplicationRecord
  include FileUploader::Attachment(:file)

  enum status: { pending: 0, completed: 1, failed: 2 }, _default: :pending
end
