require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validation' do
    subject { build(:transaction) }
    it { is_expected.to be_valid }

    context 'when item_id is nil' do
      subject { build(:transaction, item_id: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when buyer_id is nil' do
      subject { build(:transaction, buyer_id: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when item_name is nil' do
      subject { build(:transaction, item_name: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when item_price is nil' do
      subject { build(:transaction, item_price: nil) }
      it { is_expected.to be_invalid }
    end
  end
end
