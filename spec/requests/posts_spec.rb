require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "create" do
    before do
      @user = FactoryBot.create(:user)
    end
    
    it "メール投稿" do
      post_params = FactoryBot.attributes_for(:post)
      sign_in @user
      expect{ 
        post "/posts", params: { post: post_params} 
      }.to change(Post, :count).by(1) 
    end
  end
end
