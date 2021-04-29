FactoryBot.define do
  factory :conversation do
    sender {create(:user)}
    recipient {create(:user)}
    sender_id { sender.id }
    recipient_id { recipient.id }
  end
end