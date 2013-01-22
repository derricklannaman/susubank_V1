require 'spec_helper'

feature "On banker sign up page >>" do

  scenario 'show sign up page' do
    visit new_banker_path
    page.should have_content 'Sign Up'
  end


end