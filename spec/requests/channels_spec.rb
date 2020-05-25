require 'rails_helper'

RSpec.describe "Channels", type: :request do
  describe "create" do
    before do
      @user = FactoryBot.create(:user)
    end
    
    it "チャット投稿" do
      channel_params = FactoryBot.attributes_for(:channel )
      sign_in @user
      expect{ 
        post "/channels", params: {channel: channel_params} 
      }.to change(Channel, :count).by(1) 
    end
  end
end
