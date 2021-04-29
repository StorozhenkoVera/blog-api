require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:user) {create(:user)}
  let!(:receiver) {create(:user)}
  let!(:conversation) {create(:conversation)}

  it 'saves message' do
    expect(Message.new(user_id: user.id, conversation_id: conversation.id, body: 'body')).to be_valid
  end

  it 'does not save message without body' do
    expect(Message.new(user_id: user.id, conversation_id: conversation.id)).to_not be_valid
  end
end