# login
def sign_in user
	visit login_path
	fill_in :username, with: user.username
	fill_in :password, with: user.password
	cookies[:remember_token] = user.remember_token
	click_button "Войти"
end