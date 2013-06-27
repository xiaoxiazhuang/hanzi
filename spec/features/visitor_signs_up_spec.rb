require 'spec_helper'
require 'factory_girl_rails'

feature 'Visitor signs up', %{
  As a Visitor
  I want to sign up
  So I can access website features
} do

  scenario "Visitor sees link to sign up on bottom of homepage" do
    visit root_path
    expect(page).to have_content("Sign Up")
  end

  scenario "Visitor sees form to input login information" do
    visit new_user_registration_path
    fill_in 'Email', :with => 'email@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Create account'
    expect(page).to have_content('Thanks for signing up!')
  end

  scenario "Visitor must input email address" do
    visit new_user_registration_path
    fill_in 'Email', :with => ''
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Create account'
    expect(page).to have_content('Please review the problems below:')
  end

  scenario "Visitor must input password" do
    visit new_user_registration_path
    fill_in 'Email', :with => 'email@email.com'
    fill_in 'Password', :with => ''
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Create account'
    expect(page).to have_content('Please review the problems below:')
  end
  
  scenario "Visitor must input password confirmation" do
    visit new_user_registration_path
    fill_in 'Email', :with => 'email@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => ''
    click_button 'Create account'
    expect(page).to have_content('Please review the problems below:')
  end

  # scenario "Visitor clicks 'sign up' to save information" do
  #   visit new_user_registration_path
  #   fill_in 'Email', :with => 'email@email.com'
  #   fill_in 'Password', :with => 'password'
  #   fill_in 'Password confirmation', :with => 'password'
  #   click_button 'Create account'
  #   expect(page).to have_content('Thanks for signing up!')
  # end

  # scenario "Visitor sees a message that they have signed up"

  scenario "Visitor does not see a link to sign up on homepage after signing in" do
    visit new_user_registration_path
    fill_in 'Email', :with => 'email@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Create account'
    expect(page).to_not have_selector("input[type=submit][value='Sign up']")
  end

  # scenario "Visitor directed to dashboard after signing up" do
  #   visit new_user_registration_path
  #   fill_in 'Email', :with => 'email@email.com'
  #   fill_in 'Password', :with => 'password'
  #   fill_in 'Password confirmation', :with => 'password'
  #   click_button 'Create account'
  #   expect(page).to have_css('')
  # end
end
