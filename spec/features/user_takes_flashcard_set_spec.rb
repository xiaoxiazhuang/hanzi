require 'spec_helper'
require 'factory_girl_rails'

feature 'User takes flashcard set', %q{
  As a User
  I want to take the flashcard set
  So I can learn 10 Chinese characters 
  } do

  scenario 'clicking on button on homepage starts the set' do
    set = FactoryGirl.create(:flashcard_set)
    flashcard = FactoryGirl.create(:flashcard, flashcard_set: set)

    visit root_path

    click_link 'Start Set'

    page.should have_content(flashcard.character)
    page.should have_content(flashcard.pinyin)
    page.should have_content(flashcard.english_translation)
  end

  scenario "User sees all flashcards once during set" do
    set = FactoryGirl.create(:flashcard_set)
    flashcard2 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 2)
    flashcard3 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 3)
    flashcard1 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 1)

    visit root_path
    click_link 'Start Set'
    page.should have_content(flashcard1.english_translation)
    click_button 'Next'
    page.should have_content(flashcard2.english_translation)
    click_button 'Next'
    page.should have_content(flashcard3.english_translation)
  end

  scenario "User sees a flashcard only once during each set" do
    set = FactoryGirl.create(:flashcard_set)
    flashcard2 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 2)
    flashcard3 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 3)
    flashcard1 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 1)

    visit root_path
    click_link 'Start Set'
    page.should have_content(flashcard1.english_translation)
    click_button 'Next'
    page.should have_content(flashcard2.english_translation)
    click_button 'Next'
    page.should have_content(flashcard3.english_translation)
    click_button 'Next'
    page.should_not have_content(flashcard1)
    page.should_not have_content(flashcard2)
    page.should_not have_content(flashcard3)
  end

  scenario "User sees flashcards in random order" do
    set = FactoryGirl.create(:flashcard_set)
    flashcard2 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 2)
    flashcard3 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 3)
    flashcard1 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 1)

    visit root_path
    click_link 'Start Set'
    page.should have_content(flashcard1.english_translation)
    click_button 'Next'
    page.should have_content(flashcard2.english_translation)
    click_button 'Next'
    page.should have_content(flashcard3.english_translation)
  end

  scenario "User redirected to dashboard after last flashcard in set has been clicked on" do
    set = FactoryGirl.create(:flashcard_set)
    flashcard2 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 2)
    flashcard3 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 3)
    flashcard1 = FactoryGirl.create(:flashcard, flashcard_set: set, position: 1)

    visit root_path
    click_link 'Start Set'
    page.should have_content(flashcard1.english_translation)
    click_button 'Next'
    page.should have_content(flashcard2.english_translation)
    click_button 'Next'
    page.should have_content(flashcard3.english_translation)
    click_button 'Next'
    page.should have_content('Welcome to Hanzi')
  end
end
