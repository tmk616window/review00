require 'rails_helper'

RSpec.describe Chat, type: :model do
    
    it "コンテントが有効な状態である" do
        @chat = FactoryBot.build(:chat)
        expect(@chat).to be_valid
    end
    
    it "コンテントがない場合無効である" do
        @chat = FactoryBot.build(:chat,content: nil)
        @chat.valid?
        expect(@chat.errors[:content]).to include("can't be blank")
    end
end
