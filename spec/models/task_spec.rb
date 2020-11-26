require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'prepモデルについて' do
    context '現実と夢の記述がうまくいくとき' do
      it "now,target両方あると登録できる" do
        expect(@task).to be_valid
      end
    end

    context '現実と夢の記述がうまくいかないとき' do
      it "現実がからの場合登録できない" do
        @task.now = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "夢がからの場合登録できない" do
        @task.target = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "現実と夢がからの場合登録できない" do
        @task.now = ""
        @task.target = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("ニックネームを入力してください")
      end
    end
  end
end
