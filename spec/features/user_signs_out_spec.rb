require "spec_helper"

feature "user will logout" do

  let!(:user){ FactoryGirl.create(:user) }

  scenario "Signed-in user signs out" do
    visit(root_path)
    within(".sign-in") do
     click_link("Sign In")
    end
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    click_link("Logout")
    expect(page).to have_content("Signed out successfully")
  end
end
