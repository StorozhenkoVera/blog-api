require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let!(:sender) {create(:user)}
  let!(:receiver) {create(:user)}
  let!(:conversation) {create(:conversation)}

  it 'creates conversation if not exists' do
    expect(Conversation.new(sender_id: sender.id, recipient_id: receiver.id)).to be_valid
  end

  it 'does not creates conversation if already exists' do
    expect(Conversation.new(sender_id: conversation.sender_id, recipient_id: conversation.recipient_id)).to_not be_valid
  end
end
