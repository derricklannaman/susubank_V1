require 'spec_helper'

# feature "on info pages >>" do

#   scenario 'show index page' do
#     visit root_path
#     page.should have_content 'Welcome to Susubank'
#   end

#   # scenario 'show susu 101 page' do
#   #   visit susu101_path
#   #   page.should have_content 'Learn about susus'
#   # end

#   # scenario 'show about page' do
#   #   visit about_path
#   #   page.should have_content 'About'
#   # end

#   end

describe 'Info page' do

  describe 'Home page' do

    it "should have selector h1 'Welcome to Susubank'" do
      visit root_path
      page.should have_selector('h1', :text => 'Welcome to Susubank')
    end
  end

end

