require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameがなければ無効"do
    user=User.new(name:nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "nameがなければ無効"do
    user=User.new(name:nil)
    user.valid?
    expect(user.errors[:name]).not_to include("can't be blank")
  end
end
