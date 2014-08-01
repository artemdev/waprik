# login
def sign_in user
	visit login_path
	fill_in "Имя пользователя", with: user.username
	fill_in "Пароль", with: user.password
	cookies[:remember_token] = user.remember_token
	click_button "Войти"
end