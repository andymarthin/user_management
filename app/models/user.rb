# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  address       :text
#  date_of_birth :date
#  email         :string
#  first_name    :string
#  gender        :string
#  job           :string
#  last_name     :string
#  phone_number  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
end
