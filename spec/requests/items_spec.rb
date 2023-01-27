require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "PUT /items/:id" do
    let(:user) { create(:user) }
    let(:item) { create(:item, user: user) }

    it 'returns updated object' do
      put item_path(item), params: { user_id: user.id, item: { name: '商品名(edited)', price: 10_000 } }

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body["name"]).to eq '商品名(edited)'
      expect(body["price"]).to eq 10_000
    end

    context 'when API called by other user' do
      it 'returns 403' do
        put item_path(item), params: { user_id: user.id + 1, item: { name: '商品名(edited)', price: 10_000 } }

        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
