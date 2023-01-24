require 'rails_helper'

RSpec.describe "Signup", type: :request do
  describe "POST /signup" do
    let(:nickname) { 'kawakubox' }
    let(:email) { 'shigefumi.kawakubo@gmail.com' }
    it 'creates a users record' do
      expect {
        post signup_path, params: { nickname: nickname, email: email, password: 'hogehoge' }
      }.to change {
        User.where(email: email).count
      }.by(1)
    end

    it 'get 10,000 points' do
      post signup_path, params: { nickname: nickname, email: email, password: 'hogehoge' }
      user = User.find_by_email(email)
      expect(user.user_point.point).to eq 10_000
    end
  end
end
