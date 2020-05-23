require 'rails_helper'

RSpec.feature "Messages", type: :feature do
    scenario "イベントの新規作成" do
        @user = FactoryBot.create(:user)
        
        visit root_path
        click_link "ログイン"
        fill_in "session_email", with: @user.email
        fill_in "session_password", with: @user.password
        click_button "ログイン"
        
        expect{
            click_link "イベント主催"
            fill_in "message_name", with: "勉強会"
            fill_in "message_content", with: "勉強会"
            fill_in "message_date", with: "2020/6/16"
            fill_in "message_message_place", with: "渋谷駅"
            fill_in "message_people", with: 4
            fill_in "message_message_coment", with: "よろしくお願いします"
            click_button "投稿"
            
        }.to change(@user.messages, :count).by(1)
    end
end
