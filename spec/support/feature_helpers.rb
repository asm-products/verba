module FeatureHelpers
  def sign_in_as(user)
    visit root_path
    fill_in "username", with: user.username
    fill_in "password", with: "12345"
    click_button "Login"
  end
end
