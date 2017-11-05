require 'rails_helper'

RSpec.feature "users can create new projects" do
  before do
    visit "/"

    click_link "New Project"
  end

  scenario "with valid form data" do
    fill_in "Name", with: "Carnival"
    fill_in "Description", with: "A party for Mardi Gras week"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by_name("Carnival")
    expect(page.current_url).to eq project_url(project)

    title = "Carnival - Projects - TicketApp"
    expect(page).to have_title title
  end

  scenario "when providing invalid form data" do
    click_button "Create Project"

    expect(page).to have_content "Project has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end