require 'rails_helper'
include FeatureHelpers

feature "notifications" do
  let(:user) { create(:user) }
  let(:text) { "Hello " * 1000 }
  let!(:prompt) { create(:prompt, prompt_of_the_day: true) }

  scenario "when an achievement is earned" do
    sign_in_as user
    find(".start-writing").click
    fill_in "post[content]", with: text
    click_button "X"
    expect(page).to have_css(".achievement")
  end
end
