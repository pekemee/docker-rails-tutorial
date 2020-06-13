require 'rails_helper'

RSpec.describe Micropost, type: :model do
  it "micropostはcontentがあれば有効"do
    user = FactoryBot.create(:user)
    micropost = user.microposts.create(
      content:"aaaa"
    )
    expect(micropost).to be_valid
    
    micropost = FactoryBot.build(:micropost,content:"")
    expect(micropost).not_to be_valid
  end
end
