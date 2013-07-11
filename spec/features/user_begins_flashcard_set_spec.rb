require 'spec_helper'
require 'factory_girl_rails'

feature 'Signed in user begins flashcard set', %{
  As a signed in user
  I want to begin the flashcard set
  So I can start the flashcard set
} do

  scenario 'clicking on button on homepage starts the set' do
    set = FactoryGirl.create(:flashcard_set)
    flashcard = FactoryGirl.create(:flashcard, flashcard_set: set)

    visit new_user_session_path
    fill_in 'Email', :with => "email@email.com"
    fill_in 'Password', :with => "password"
    click_button 'Sign in'
    click_button 'Select a Flashcard Set'
    click_button 'Start Set'

    page.should have_content(flashcard.character)
    page.should have_content(flashcard.pinyin)
    page.should have_content(flashcard.english_translation)
  end

end
