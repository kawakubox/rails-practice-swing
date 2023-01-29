# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserPoint' do
  describe 'validation' do
    context 'when point is 0' do
      subject { build(:user_point, point: 0) }
      it { is_expected.to be_valid }
    end

    context 'when point is -1' do
      subject { build(:user_point, point: -1) }
      it { is_expected.to be_invalid }
    end
  end

  describe '#spend' do
    let(:user_point) { create(:user_point, point: 10_000) }
    it 'reduce usage points' do
      expect { user_point.spend(3_000) }.to change { user_point.reload.point }.to(7_000)
    end

    context 'when have not enough points' do
      it 'raises ActiveRecord::RecordInvalid' do
        expect { user_point.spend(10_001) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
