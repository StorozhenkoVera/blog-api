require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user)}

  context 'users controller' do
    it 'shows all users' do
      get :index
        expect((JSON.parse(response.body)).join).to include("id", "name", "created_at", "updated_at")
        expect(response).to have_http_status(:ok)
    end

    it 'creates new user' do
      expect {
        get :create, params: { name: 'Name' }
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it 'shows user' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(4)
    end
  end
end