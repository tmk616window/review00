require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "create" do
    context "権限のあるユーザー" do
      before do
        @user = FactoryBot.create(:user)
      end
      
      it "プロジェクト追加" do
        task_params = FactoryBot.attributes_for(:task)
        sign_in @user
        expect{
          post :create, params: {project: task_params}
        }.to change(@user.projects, :count).by(1)
      end
    end
  end
end
