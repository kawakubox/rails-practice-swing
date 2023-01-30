require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'when nickname is nil' do
      subject { build(:user, nickname: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when email is nil' do
      subject { build(:user, email: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when email is already exists' do
      let(:email) { 'sample@example.com' }
      before { create(:user, email: email) }
      subject { build(:user, email: email) }
      it { is_expected.to be_invalid }
    end

    context 'when password is nil' do
      subject { build(:user, password: nil) }
      it { is_expected.to be_invalid }
    end
  end
end
