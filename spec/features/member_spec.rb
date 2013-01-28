require 'spec_helper'

describe 'members pages' do

  describe 'member index page' do

    it "should have an h1 with the content 'All members' " do
      visit susu_members_path
      page.should have_selector('h1', :text => 'All members')
    end

  end








end