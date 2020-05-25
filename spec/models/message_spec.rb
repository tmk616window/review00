require 'rails_helper'

RSpec.describe Message, type: :model do
  it "外部キーが有効である" do
      @user = FactoryBot.create(:user)
      message = FactoryBot.create(:message, user: @user)
      expect(message).to be_valid
  end
  

  it "イベント名がない場合、無効である" do
    @message = FactoryBot.build(:message,name: nil)
    @message.valid?
    expect(@message.errors[:name]).to include("can't be blank")
  end
  it "コメントがない場合、無効である" do
    @message = FactoryBot.build(:message,content: nil)
    @message.valid?
    expect(@message.errors[:content]).to include("can't be blank")
  end
  it "日時がない場合、無効である" do
    @message = FactoryBot.build(:message,date: nil)
    @message.valid?
    expect(@message.errors[:date]).to include("can't be blank")
  end
  it "コメントがない場合、無効である" do
    @message = FactoryBot.build(:message,message_coment: nil)
    @message.valid?
    expect(@message.errors[:message_coment]).to include("can't be blank")
    
  end
  it "場所がない場合、無効である" do
    @message = FactoryBot.build(:message,message_place: nil)
    @message.valid?
    expect(@message.errors[:message_place]).to include("can't be blank")
  end
  it "人数がない場合、無効である" do
    @message = FactoryBot.build(:message,people: nil)
    @message.valid?
    expect(@message.errors[:people]).to include("can't be blank")
    
  end
  it "外部キーがない場合、無効である" do
    @message = FactoryBot.build(:message,user_id: nil)
    @message.valid?
    expect(@message.errors[:user_id]).to include("can't be blank")
  end

end
