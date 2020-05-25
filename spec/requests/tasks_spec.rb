require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "edit" do
    context "認証されたユーザー" do
      before do
        @user = FactoryBot.create(:user)
        @task = FactoryBot.create(:task , user: @user)
      end
      
      it "正常にレスポンスを返す" do
        sign_in @user
        get "/tasks" + "/" + @user.id.to_s + "/edit", params: {id: @task.id}
        expect(response.status).to eq 200
      end
      
      it 'ユーザー名が表示されていること' do
        sign_in @user
        get "/tasks" + "/" + @user.id.to_s + "/edit"
        expect(response.body).to include 'Ruby'
      end      
    end
  end
  

  describe "update" do
    context "認可されたユーザー" do
      before do
        @user = FactoryBot.create(:user ,email: "task_update@example.com")
        @task = FactoryBot.create(:task , user: @user)
      end
      
      it "プロジェクトの更新" do
        task_params = FactoryBot.attributes_for(:task, task_pl:"python")
        sign_in @user
        patch "/tasks" + "/" + @user.id.to_s, params: {id: @task.id, task: task_params}
        expect(@task.reload.task_pl).to eq "python"
      end
    end
    
    context "認可されてないユーザー" do
        before do
          @user = FactoryBot.create(:user)
          other_user = FactoryBot.create(:user ,email: "not_edit_task@examole.com")
          @task = FactoryBot.create(:task, user: other_user , task_pl: "same old")
        end
        
        it "プロジェクト更新できない" do
          task_params = FactoryBot.attributes_for(:task, task_pl: "new" ,user: @user)
          sign_in @user
          patch "/tasks" + "/" + @user.id.to_s, params: {id: @task.id, task: task_params}
          expect(response.status).to eq 302
        end
        
        it "リダイレクトする" do
          task_params = FactoryBot.attributes_for(:task)
          sign_in @user
          patch "/tasks" + "/" + @user.id.to_s, params: {id: @task.id, task: task_params}
          expect(response).to redirect_to "/tasks" + "/" + @user.id.to_s
        end
    end
  end
  
  describe "destroy" do
    context "権限のあるユーザー" do
      before do
        @user = FactoryBot.create(:user)
        @task = FactoryBot.create(:task ,user: @user)
      end
      
      it "プロジェクト編集" do
        sign_in @user
        expect{
        delete "/tasks" + "/" + @user.id.to_s, params: {id: @task.id}
        }.to change(@user.tasks, :count).by(-1)
      end
    end
    
    context "認証されてない" do
        before do
          @user = FactoryBot.create(:user)
          other_user = FactoryBot.create(:user, email: "other_user@example.com")
          @task = FactoryBot.create(:task, user: other_user)
        end
        
        it "プロジェクト消去できない" do
          sign_in @user
          expect {
          delete "/tasks" + "/" + @user.id.to_s, params: {id: @task.id}
          }.to change(Task, :count)
          expect(response.status).to eq 302
        end
        
        it "リダイレクトする" do
          sign_in @user
          delete "/tasks" + "/" + @user.id.to_s, params: {id: @task.id}
          expect(response).to redirect_to "/tasks"
        end
    end
  end
end
