require 'rails_helper'

RSpec.describe Task, type: :model do
  it "外部キーが有効である" do
    @user = FactoryBot.create(:user)
    task = FactoryBot.create(:task ,user: @user)
    expect(task).to be_valid
  end
  it "タスクが有効である" do
    @task = FactoryBot.build(:task, design_point: nil)
    @task.valid?
    expect(@task.errors[:design_point]).to include("can't be blank")
  end
  it "ファンクションポイントがない場合、無効である" do
    @task = FactoryBot.build(:task, function_point: nil)
    @task.valid?
    expect(@task.errors[:function_point]).to include("can't be blank")
  end
  it "プランポイントがない場合、無効である" do
    @task = FactoryBot.build(:task, plam_point: nil)
    @task.valid?
    expect(@task.errors[:plam_point]).to include("can't be blank")
    
  end
  it "ユニークポイントがない場合、無効である" do
    @task = FactoryBot.build(:task, unique_point: nil)
    @task.valid?
    expect(@task.errors[:unique_point]).to include("can't be blank")

  end
  it "ユーザビリティポイントがない場合、無効である" do
    @task = FactoryBot.build(:task, user_perspective_point: nil)
    @task.valid?
    expect(@task.errors[:user_perspective_point]).to include("can't be blank")
    
  end
  it "採用方法がない場合、無効である" do
    @task = FactoryBot.build(:task, recruit: nil)
    @task.valid?
    expect(@task.errors[:recruit]).to include("can't be blank")
    
  end
  it "分野がない場合、無効である" do
    @task = FactoryBot.build(:task, field: nil)
    @task.valid?
    expect(@task.errors[:field]).to include("can't be blank")
    
  end
  it "開発言語がない場合、無効である" do
    @task = FactoryBot.build(:task, task_pl: nil)
    @task.valid?
    expect(@task.errors[:task_pl]).to include("can't be blank")
  end
  it "開発ツールがない場合、無効である" do
    @task = FactoryBot.build(:task, task_tool: nil)
    @task.valid?
    expect(@task.errors[:task_tool]).to include("can't be blank")
  end
  it "作品がない場合、無効である"  do
    @task = FactoryBot.build(:task, github_url: nil)
    @task.valid?
    expect(@task.errors[:github_url]).to include("can't be blank")
  end
  it "会社情報がない場合、無効である" do
    @task = FactoryBot.build(:task, company_info: nil)
    @task.valid?
    expect(@task.errors[:company_info]).to include("can't be blank")
  end
  it "コメントがない場合、無効である" do
    @task = FactoryBot.build(:task, task_coment: nil)
    @task.valid?
    expect(@task.errors[:task_coment]).to include("can't be blank")
  end
  it "勉強期間がない場合、無効である" do
    @task = FactoryBot.build(:task, study_period: nil)
    @task.valid?
    expect(@task.errors[:study_period]).to include("can't be blank")
  end
  it "メールアドレスが重複した場合無効" do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.build(:user)
    @user2.valid?
    expect(@user2.errors[:email]).to include("has already been taken")    
  end
end
