require 'rails_helper'

RSpec.describe Channel, type: :model do

    it "channelが有効な状態である" do
        @channel = FactoryBot.build(:channel)
        expect(@channel).to be_valid
    end
    
    it "user_idがない場合無効である" do
        @channel = FactoryBot.build(:channel,user_id: nil)
        @channel.valid?
        expect(@channel.errors[:user_id]).to include("can't be blank")
    end

    it "task_idがない場合無効である" do
        @channel = FactoryBot.build(:channel,task_id: nil)
        @channel.valid?
        expect(@channel.errors[:task_id]).to include("can't be blank")
    end

    
end
