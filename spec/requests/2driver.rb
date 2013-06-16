require 'spec_helper'
require "watir-webdriver"
require 'watir-webdriver/extensions/alerts'

browser = Watir::Browser.new
location_of_BCS = "http://localhost"
port_of_BCS = "3000"
link_to_BCS = location_of_BCS + ":" + port_of_BCS

RSpec.configure do |config|
	config.after(:suite) { browser.close unless browser.nil? }
end

describe "Test the driver functionalities" do
	before(:each) do
		browser.goto link_to_BCS + '/log_in'
		browser.text_field(:name => 'session[email]').set("driver@bcs.org")
		browser.text_field(:name => 'session[password]').set("foobar")
		browser.button(:value => "Log in").click
	end

	describe "Main page buttons" do
		it "should consist of the main menu page" do
			browser.text.should_not include('List of Users')
			browser.text.should include('List of Tickets')
			browser.text.should include('List of my Tickets')
			browser.text.should include('Search')
			browser.text.should include('List of Buses')
		end
	end
end

