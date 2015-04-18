module FeatureHelpers
  def sign_in_as(user)
    visit root_path
    fill_in "username", with: user.username
    fill_in "password", with: "12345678"
    click_button "Login"
  end

  def register_user
    visit root_path
    click_link "Register"
    fill_in "username", with: "garrettqmartin"
    fill_in "email", with: "garrett@example.com"
    fill_in "password", with: "12345678"
    fill_in "password confirmation", with: "12345678"
    click_button("Register")
  end
end
