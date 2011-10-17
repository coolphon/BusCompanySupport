class Ticket < ActiveRecord::Base
  attr_accessible :nameOfTrip, :dateOfTrip, :timeOfTrip

  belongs_to :user
end


# == Schema Information
#
# Table name: tickets
#
#  id         :integer         not null, primary key
#  nameOfTrip :string(255)
#  dateOfTrip :date
#  timeOfTrip :time
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
