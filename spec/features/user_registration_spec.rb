require 'rails_helper'
include FeatureHelpers

feature "registration" do
  scenario "after registration, a user should be redirected to welcome page" do
    register_user
    expect(page).to have_content("Welcome")
  end
end
