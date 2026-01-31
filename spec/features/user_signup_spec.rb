require 'rails_helper'

RSpec.describe 'User sign up', type: :feature do
  it 'allows a user to sign up' do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: 'test+rspec@example.com'
    fill_in 'Nickname', with: 'TestUser'
    fill_in 'Password', with: 'password123'

    click_button 'Sign up'

    user = User.find_by(email: 'test+rspec@example.com')
    expect(user).not_to be_nil
    expect(page).to have_css("turbo-stream[action='redirect'][target='/users/#{user.id}']")
  end
end
