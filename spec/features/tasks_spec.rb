require 'rails_helper'


RSpec.feature "Tasks", type: :feature do
    scenario "Taskの新規作成" do
        @user = FactoryBot.create(:user)
        
        visit root_path
        click_link "ログイン"
        
        fill_in "session_email", with: @user.email
        fill_in "session_password", with: @user.password
        click_button "ログイン"
        
        expect{
            click_link "ポートフォリオ投稿"
            select 1, from: "task_design_point"
            select 1, from: "task_function_point"
            select 1, from: "task_plam_point"
            select 1, from: "task_unique_point"
            select 1, from: "task_user_perspective_point"
            fill_in "task_task_coment", with: "コメント"
            select "新卒", from: "task_recruit"
            select "自社開発", from: "task_company_info"
            fill_in "task_field", with: "バックエンド"
            fill_in "task_task_pl", with: "Ruby"
            fill_in "task_task_tool", with: "Git"
            fill_in "task_github_url", with: "tmk616/github.com"
            fill_in "task_study_period", with: 6
            click_button "投稿"
            
        }.to change(@user.tasks, :count).by(1)
    end
end
