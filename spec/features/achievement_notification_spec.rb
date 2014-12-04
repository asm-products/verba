require 'rails_helper'
include FeatureHelpers

feature "notifications" do
  let(:user) { create(:user) }
  let(:text) { "Hello" * 1000 }

  scenario "when an achievement is earned" do
    sign_in_as user
    click_link "Start writing"
    fill_in "writing-textarea", with: text
    click_button "X"
    expect(page).to have_css(".achievement")
  end
end
