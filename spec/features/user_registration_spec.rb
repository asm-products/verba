require 'rails_helper'
include FeatureHelpers

feature "registration" do
  scenario "after registration, a user should be redirected to welcome page" do
    prompt = double("prompt")
    expect(Prompt).to receive(:today).and_return(prompt)
    expect(prompt).to receive(:content).and_return("This is the prompt.")

    register_user
    expect(page).to have_content("Welcome")
  end
end
