require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'taskモデルについて' do
    context 'task_1,task_2,task_3の記述がうまくいくとき' do
      it "task_1,task_2,task_3があると登録できる" do
        expect(@task).to be_valid
      end
    end

    context 'task_1,task_2,task_3の記述がうまくいかないとき' do
      it "task_1がからだとと登録できない" do
        @task.task_1 = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("期日を入力してください")
      end
      it "task_2がからだとと登録できない" do
        @task.task_2 = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("なにをするかを入力してください")
      end
      it "task_3がからだとと登録できない" do
        @task.task_3 = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("どんな方法でするかを入力してください")
      end
      it "task_1,task_2,task_3がからだとと登録できない" do
        @task.task_1 = ""
        @task.task_2 = ""
        @task.task_3 = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("期日を入力してください", "なにをするかを入力してください", "どんな方法でするかを入力してください")
      end
    end
  end
end

