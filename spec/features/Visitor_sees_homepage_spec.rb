# encoding: UTF-8 

require 'spec_helper'
require 'factory_girl_rails'

  feature 'Visitor sees homepage', %{
    As a Visitor
    I want to see the homepage
    So I can understand more about the website
  } do
    
    scenario "Visitor sees homepage with 'About Hanzi' section" do
      visit root_path
      expect(page).to have_content('About Hanzi')
      expect(page).to have_content('关于汉字')
    end

    scenario "Visitor sees 'sign up' button at the bottom of page" do
      visit root_path
      click_button "Sign up"
      expect(page).to have_content("Sign up")
    end
  end
