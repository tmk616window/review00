require 'rails_helper'

RSpec.describe User, type: :model do

it "メールアドレス、パスワードがある場合有効" do
    @user = FactoryBot.build(:user)
    
    expect(@user).to be_valid
end


 it "メールアドレスがない場合、無効である" do
    @user = FactoryBot.build(:user, email: nil)
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
end
  it "パスワードがない場合、無効である" do
    @user = FactoryBot.build(:user, password: nil)
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end
  it "重複したメールアドレスの場合、無効である" do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.build(:user)
    @user2.valid?
    expect(@user2.errors[:email]).to include("has already been taken")
  end

    

    
end
