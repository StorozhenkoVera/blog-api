require 'rails_helper'

RSpec.describe 'GET conversations#index (root_path) ', type: :routing do
  let!(:conversation) {create(:conversation)}
  it 'routes root_path to conversations#index' do
    expect(get("/")).to route_to("conversations#index")
  end

  it 'routes post create to conversations#create' do
    expect(post("/conversations")).to route_to("conversations#create")
  end

  it 'routes get conversation conversations#show' do
    expect(get("/conversations/#{conversation.id}")).to route_to("conversations#show")
  end
end