# You are the new web developer for Hogwarts. The IT staff has provided an API where you can get a listing of students.
#
# `http://hogwarts-it.herokuapp.com`
#
# You are to create an app and complete this following user story:
#
# ```
require "rails_helper"

describe "As a user" do
  it "should be able to get a list of slytherin members" do
    # When I visit "/"
    visit "/"
    # And I select "Slytherin" from the dropdown

    find('#house').find(:xpath, 'option[3]').select_option
    # And I click on "Get Students"
    click_on "Get Students"

    # Then my path should be "/search" with "house=slytherin" in the parameters
    # expect(current_path).to eq("/search?house=slytherin")

    # And I should see a message "22 Students"
    expect(page).to have_content("22 Students")

    # And I should see a list of the 22 members of Slytherin
    expect(page.all('#students').count).to eq(22) #one extra ul from the dropdown so minus 1 22
    # And I should see a name and id for each student.
    within first('#students') do
      expect(page).to have_content("Gormlaith Gaunt")
      expect(page).to have_content("52")
    end
  end
end
# ```
#
#
# Your key is: alohamora
