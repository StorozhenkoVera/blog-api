require 'rails_helper'

RSpec.describe 'User-chat interaction', type: :system do
  it 'allow user to login and write message' do
    # User opens root path
    visit root_path

    # User enters nickname and clicks join chat button
    expect(page).to have_content('Enter your nickname')
    name_input = page.find('input')
    name_input.set('Ivan')
    click_on('Join chat')

    # create user with nickname
    # create conversation (find first if exist)
    # redirect to conversation#show

    # User sees messages area and message prompt
    messages_area = page.find('.messages')
    expect(messages_area.text).to be_blank

    # User able to type message and press send
    input_prompt = page.find('input')
    input_prompt.set('Hello')
    click_on('Send')

    # Message appears in a messages area
    expect(messages_area).to have_content('Ivan')
    expect(messages_area).to have_content('Hello')
  end
end