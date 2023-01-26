# frozen_string_literal: true

class SignupController < ApplicationController
  def signup
    ActiveRecord::Base.transaction do
      user = User.create!(signup_params)
      user.create_user_point!(point: 10_000)
    end
  end

  private

  def signup_params
    params.permit(:nickname, :email, :password)
  end
end
