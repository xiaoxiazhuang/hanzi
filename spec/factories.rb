# encoding: utf-8

FactoryGirl.define do

  factory :user do
    email 'email@email.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :flashcard_set do
    name 'HSK Level 1'
  end

  factory :flashcard do
    flashcard_set
    character '福'
    sequence(:pinyin) { |n| "fu#{n}" }
    sequence(:english_translation) { |n| "fortune#{n}" }
    position 1
  end
  
end
