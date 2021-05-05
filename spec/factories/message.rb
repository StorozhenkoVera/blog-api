FactoryBot.define do
  factory :message do
    body { 'body' }
    conversation { create(:conversation) }
    user { create(:user) }
    conversation_id { conversation.id }
    user_id { user.id }
  end
end