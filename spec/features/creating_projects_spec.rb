require 'rails_helper'

RSpec.feature "users can create new projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"

    fill_in "Name", with: "Carnival"
    fill_in "Description", with: "A party for Mardi Gras week"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end
end