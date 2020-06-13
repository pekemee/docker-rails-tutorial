require 'rails_helper'

RSpec.describe User, type: :model do
  it "name,email,passwordがあれば有効"do
    user=User.new(
      name:"test",
      email:"test@test.com",
      password:"password",
    )
    expect(user).to be_valid
  end

  it "nameがないと無効"do
    user=User.new(
      name:nil,
      email:"test@test.com",
      password:"password"
    )
    expect(user).not_to be_valid
  end

  it "test@test is wrong email_format"do
    user=FactoryBot.build(:user,email:"test@test")
    expect(user).not_to be_valid
  end

  it "emailの重複は無効"do
    user=User.create(
      name:"test",
      email:"test@test.com",
      password:"password",
    )
    user=User.new(
      name:"test2",
      email:"test@test.com",
      password:"passpass",
    )
    expect(user).not_to be_valid
  end


end
