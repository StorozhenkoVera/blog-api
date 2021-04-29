require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  context 'get#index' do
    it 'routes root_path to conversations#index' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context 'get#create' do
    let!(:conversation) {create(:conversation)}

    it 'finds existing conversation and redirects' do
      post :create, params: { sender_id: conversation.sender_id, recipient_id: conversation.recipient_id }
      expect(response).to redirect_to("/conversations/#{conversation.id}/messages")
    end
  end
end