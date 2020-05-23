require 'rails_helper'

RSpec.describe Post, type: :model do
    it "postが有効な状態である" do
        @post = FactoryBot.build(:post)
        expect(@post).to be_valid
    end
    
    it "名前がないな場合、無効である" do
        @post = FactoryBot.build(:post, post_name: nil)
        @post.valid?
        expect(@post.errors[:post_name]).to include("can't be blank")
    end
    it "コメントがないな場合、無効である" do
        @post = FactoryBot.build(:post, post_content: nil)
        @post.valid?
        expect(@post.errors[:post_content]).to include("can't be blank")
    end
    it "年齢がないな場合、無効である" do
        @post = FactoryBot.build(:post, post_old: nil)
        @post.valid?
        expect(@post.errors[:post_old]).to include("can't be blank")
    end
    it "職業がないな場合、無効である" do
        @post = FactoryBot.build(:post, post_job: nil)
        @post.valid?
        expect(@post.errors[:post_job]).to include("can't be blank")
    end
    it "メールアドレスがないな場合、無効である" do
        @post = FactoryBot.build(:post, post_email: nil)
        @post.valid?
        expect(@post.errors[:post_email]).to include("can't be blank")
    end
    it "post_idがないな場合、無効である" do
        @post = FactoryBot.build(:post, post_id: nil)
        @post.valid?
        expect(@post.errors[:post_id]).to include("can't be blank")
    end
    it "性別がないな場合、無効である" do
        @post = FactoryBot.build(:post, post_sex: nil)
        @post.valid?
        expect(@post.errors[:post_sex]).to include("can't be blank")
    end
    
end
