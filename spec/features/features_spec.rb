
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
# feature 'Makers can post messages to chitter' do
#   scenario 'Maker can type message text into a text form' do
#     visit '/peep'
#     expect expect(page).to have_field("peep")
#   end
  #
  # scenario 'Makers can post their peeps' do
  #   visit '/peep'
  #   fill_in('peep', with: "Test message")
  #   click_button 'Peep'
  #   expect(page).to have_content("Test message")
  # end
# end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Makers can sign up for Chitter' do
  scenario 'There is a sign-up page with a form for username and email address' do
    visit '/sign_up'
    fill_in('username', with: "Beelzebub")
    fill_in('email', with: "j.snow@gmail.com")
    fill_in('password', with: "iluvmum")
    click_button 'Sign Up'
    expect(page).to have_content("Thanks for signing up for Chitter, Beelzebub")
  end
  scenario 'Makers cannot have a username that is already taken' do
    visit '/sign_up'
    fill_in('username', with: "John Snow")
    fill_in('password', with: "cheekyboy")
    click_button 'Sign Up'
    visit '/sign_up'
    fill_in('username', with: "John Snow")
    fill_in('password', with: "cheekyboy")
    click_button 'Sign Up'
    expect(page).to have_content("Sorry, that username is already taken")
  end
end

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
feature 'Makers who already have accounts can login to Chitter' do
  scenario 'Makers can input their username and email address' do
    visit '/sign_up'
    fill_in('username', with: "Mavis")
    fill_in('password', with: "Seekrit")
    click_button 'Sign Up'
    visit '/login'
    fill_in('username', with: "Mavis")
    fill_in('password', with: "Seekrit")
    click_button 'Log In'
    expect(page).to have_content("Hi, Mavis!")
  end
end
