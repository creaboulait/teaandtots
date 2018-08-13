require 'rails_helper'
require 'byebug'


feature "User sign in" do
  background do
    @user = User.create(email: 'hello@hello.com', password: '1234qwer', first_name: 'Kobe', last_name: 'Bryant')
  end

  scenario "Signing in with correct credentials" do
    visit '/sign_in'
    
      fill_in 'Email', with: 'hello@hello.com'
      fill_in 'Password', with: '1234qwer'
   
    click_button 'Sign In'
    expect(current_path).to eq(user_path(@user))
  end

  given(:other_user) { User.create(email: 'other@hello.com', password: '12345678', first_name: 'abc', last_name: 'xyz') }

  scenario "Signing in as another user" do
    visit '/sign_in'
    
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: other_user.password
   
    click_button 'Sign In'
    expect(current_path).to eq(user_path(other_user))
  end

  scenario "Signing in with wrong password" do
    visit '/sign_in'
    
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: 'poiuytre'
   
    click_button 'Sign In'
    expect(current_path).to eq(sign_in_path)
  end
end
