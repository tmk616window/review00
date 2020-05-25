require 'rails_helper'

RSpec.describe "Chats", type: :request do
  describe "create" do
    before do
      @user = FactoryBot.create(:user)
    end
    
    it "チャット投稿" do
      chat_params = FactoryBot.attributes_for(:chat )
      sign_in @user
      expect{ 
        post "/chats", params: {chat: chat_params} 
      }.to change(Chat, :count).by(1) 
    end
  end
end
