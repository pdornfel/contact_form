require 'spec_helper'

feature "User visits the inquiries page", %q{
  As a site visitor
  I want to contact the sites staff
  So I can tell them how awesome they are
} do

  # Acceptance Criteria:
      # *I must specify a valid email address
      # *I must specify a subject
      # *I must specify a description
      # *I must specify a first name
      # *I must specify a last name

  context "with valid attributes" do
    it "creates an inquiry with valid attributes" do

      visit "/inquiries/new"
        fill_in "First name", with: "Paul"
        fill_in "Last name", with: "Dornfeld"
        fill_in "Email", with: "pdornfel@gmail.com"
        fill_in "Subject", with: "Very Important"
        fill_in "Description", with: "foo bar baz"
        click_on "Create Inquiry"

        expect(page).to have_content("Inquiry was successfully created")
    end
  end

  context "with invalid attributes" do
    it "displays errors for invalid attributes" do
      visit "/inquiries/new"
      click_on "Create Inquiry"

      expect(page).to have_content("All Inquiries First name Last name Email Subject Description")

    end
  end

end