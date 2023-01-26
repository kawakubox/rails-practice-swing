require 'rails_helper'

RSpec.describe ExhibitController, type: :request do
  describe "POST /exhibit" do
    let(:user) { create(:user) }

    it 'creates a items record' do
      expect {
        post exhibit_path, params: { item: { user_id: user.id, name: '激レアカード', price: 5_000 } }
      }.to change {
        Item.count
      }.by(1)
    end
  end
end
