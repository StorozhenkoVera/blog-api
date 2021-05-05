require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let!(:message) {create(:message)}

  context 'get#index' do
    it 'returns messages from conversation' do
      get :index, params: { conversation_id: message.conversation.id }
      expect(response).to have_http_status(:ok)
      expect((JSON.parse(response.body)).join).to include("id", "body", "conversation_id", "user_id")
    end
  end

  context 'get#new' do
    it 'returns messages from conversation' do
      get :new, params: { conversation_id: message.conversation.id }
      expect(JSON.parse(response.body)).to include("id", "body", "conversation_id", "user_id")
    end
  end

  context 'get#create' do
    it 'creates new message and redirects' do
      post :create, params: { conversation_id: message.conversation.id, message:{ body: message.body, user_id: message.user_id} }
      expect(response).to have_http_status(:created)
      #expect(response).to redirect_to("/conversations/#{message.conversation.id}/messages")
    end
  end
end