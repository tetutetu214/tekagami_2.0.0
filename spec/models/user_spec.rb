require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録について' do
      context '新規登録がうまくいくとき' do
        it "nickname,email,passewordがあると登録できる" do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameがからの場合登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
        it "emailがからの場合登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
        end
        it "passwordがからの場合登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
        end
        it "passwordが6文字未満の場合登録できない" do
          @user.password = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
        end
        it "passwordが半角英語のみの場合の場合登録できない" do
          @user.password = "aaaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it "passwordが半角数字のみの場合の場合登録できない" do
          @user.password = 11111111
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it "passwordが全角英数字の場合の場合登録できない" do
          @user.password = "５ｑ８ｌ９８ "
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
        end
      end
  end
end