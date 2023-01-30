require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }
  let!(:buyer) { create(:user) }

  describe "PUT /items/:id" do
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

  describe "DELETE /items/:id" do
    it do
      expect {
        delete item_path(item), params: { user_id: user.id }
      }.to change { Item.count }.by(-1)
    end

    context 'when API called by other user' do
      it 'returns 403' do
        delete item_path(item), params: { user_id: user.id + 1 }

        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "POST /items/:id/buy" do
    it do
      post buy_item_path(item), params: { buyer_id: buyer.id }

      expect(response).to have_http_status(:no_content)
    end

    it 'stored item price and name at the time of purchase' do
      post buy_item_path(item), params: { buyer_id: buyer.id }
      expect(Transaction.last).to have_attributes(item_name: item.name, item_price: item.price)
    end

    it 'add a transactions record and reduce points' do
      expect {
        post buy_item_path(item), params: { buyer_id: buyer.id }
      }.to change { Transaction.count }.by(1).
        and change { User.find(buyer.id).user_point.point }.by(item.price * -1)
    end

    context 'when buyer does not have enough points' do
      before do
        buyer.user_point.update!(point: 1_000)
        item.update!(price: 5_000)
      end

      it 'returns 422' do
        post buy_item_path(item), params: { buyer_id: buyer.id }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
