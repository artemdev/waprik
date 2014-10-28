require 'spec_helper'

describe "User" do
  it "может зарегистрироваться" do
  	username = "artem#{rand(1000000)}"
    visit signin_path
    fill_in "имя на сайте", with: username
    fill_in "пароль", with: 'secret_password'
    click_button 'продолжить'
    page.should have_content username
  end
end
