require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'when name is nil' do
      subject { build(:item, name: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when price is nil' do
      subject { build(:item, price: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when price is 0' do
      subject { build(:item, price: 0) }
      it { is_expected.to be_valid }
    end

    context 'when price is -1' do
      subject { build(:item, price: -1) }
      it { is_expected.to be_invalid }
    end

    context 'when price is 0.1' do
      subject { build(:item, price: 0.1) }
      it { is_expected.to be_invalid }
    end
  end
end
