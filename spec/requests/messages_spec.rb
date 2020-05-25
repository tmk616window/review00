require 'rails_helper'

RSpec.describe "Messages", type: :request do
  
  describe "edit" do
    context "認証されたユーザー" do
      before do
        @user = FactoryBot.create(:user)
        @message = FactoryBot.create(:message , user: @user)
      end
      
      it "正常にレスポンスを返す" do
        sign_in @user
        get "/messages" + "/" + @user.id.to_s + "/edit", params: {id: @message.id}
        expect(response.status).to eq 200
      end
      
      it 'ユーザー名が表示されていること' do
        sign_in @user
        get "/messages" + "/" + @user.id.to_s + "/edit"
        expect(response.body).to include '勉強会'
      end      
    end
  end
  

  describe "update" do
    context "認可されたユーザー" do
      before do
        @user = FactoryBot.create(:user ,email: "message_update@example.com")
        @message = FactoryBot.create(:message , user: @user)
      end
      
      it "プロジェクトの更新" do
        message_params = FactoryBot.attributes_for(:message, name:"勉強会1")
        sign_in @user
        patch "/messages" + "/" + @user.id.to_s, params: {id: @message.id, message: message_params}
        expect(@message.reload.name).to eq "勉強会1"
      end
    end
    
    context "認可されてないユーザー" do
        before do
          @user = FactoryBot.create(:user)
          other_user = FactoryBot.create(:user ,email: "not_update_message@examole.com")
          @message = FactoryBot.create(:message, user: other_user , name: "same old")
        end
        
        it "プロジェクト更新できない" do
          message_params = FactoryBot.attributes_for(:message, name: "new" ,user: @user)
          sign_in @user
          patch "/messages" + "/" + @user.id.to_s, params: {id: @message.id, message: message_params}
          expect(response.status).to eq 302
        end
        
        it "リダイレクトする" do
          message_params = FactoryBot.attributes_for(:message)
          sign_in @user
          patch "/messages" + "/" + @user.id.to_s, params: {id: @message.id, message: message_params}
          expect(response).to redirect_to "/messages" + "/" + @user.id.to_s
        end
    end
  end
  
  describe "destroy" do
    context "権限のあるユーザー" do
      before do
        @user = FactoryBot.create(:user)
        @message = FactoryBot.create(:message ,user: @user)
      end
      
      it "プロジェクト編集" do
        sign_in @user
        expect{
        delete "/messages" + "/" + @user.id.to_s, params: {id: @message.id}
        }.to change(@user.messages, :count).by(-1)
      end
    end
    
    context "認証されてない" do
        before do
          @user = FactoryBot.create(:user)
          other_user = FactoryBot.create(:user, email: "other_user@example.com")
          @message = FactoryBot.create(:message, user: other_user)
        end
        
        it "プロジェクト消去できない" do
          sign_in @user
          expect {
          delete "/messages" + "/" + @user.id.to_s, params: {id: @message.id}
          }.to change(Message, :count)
          expect(response.status).to eq 302
        end
        
        it "リダイレクトする" do
          sign_in @user
          delete "/messages" + "/" + @user.id.to_s, params: {id: @message.id}
          expect(response).to redirect_to "/messages"
        end
    end
  end

  
end
