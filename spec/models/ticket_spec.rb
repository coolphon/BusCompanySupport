require 'spec_helper'

describe Ticket do
  before(:each) do
    @user = Factory(:user)
    @attr = { :nameOfTrip => "City A -> City B", :date_of_trip => Time.now.to_date, :timeOfTrip => Time.now.to_time }
  end

  it "should create a new instance give valid attributes" do
    @user.tickets.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @ticket = @user.tickets.create(@attr)
    end

    it "should have a user attribute" do
      @ticket.should respond_to(:user)
    end

    it "should have the right associated user" do
      @ticket.user_id.should == @user.id
      @ticket.user.should == @user
    end
  end
end






# == Schema Information
#
# Table name: tickets
#
#  id               :integer         not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  user_reserved_id :integer         default(0)
#  name_of_seat       :string(255)
#  bus_id           :integer
#  date_of_trip       :datetime
#  city_from         :string(255)
#  city_to           :string(255)
#  end_of_trip        :datetime
#

