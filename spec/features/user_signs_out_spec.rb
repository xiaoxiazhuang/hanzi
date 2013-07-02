require "spec_helper"

feature "Signed in user can log out" do

  # let!(:user){ FactoryGirl.create(:user) }

  scenario "Signed in user signs out" do
    visit new_user_session_path
    fill_in 'Email', :with => "email@email.com"
    fill_in 'Password', :with => "password"
    click_button("Sign in")
    save_and_open_page
    click_button("Sign out")
    expect(page).to_not have_content("Sign out")
  end
end
