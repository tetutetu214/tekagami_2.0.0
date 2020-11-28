require 'rails_helper'

RSpec.describe Review, type: :model do
    before do
      @review = FactoryBot.build(:review)
    end
  

describe 'reviewモデルについて' do
  context '克服し現実への記述がうまくいくとき' do
    it "rev_1,rev_2,rev_3,rev_4,全てあると登録できる" do
      expect(@active).to be_valid
    end
  end

  context '克服し現実への記述がうまくいかないとき' do
    it "way_1がからだとと登録できない" do
      @active.way_1 = ""
      @active.valid?
      expect(@active.errors.full_messages).to include("いつやるのか時間を入力してください")
    end
    it "way_2がからだとと登録できない" do
      @active.way_2 = ""
      @active.valid?
      expect(@active.errors.full_messages).to include("どこでやるのか場所を入力してください")
    end
    it "way_3がからだとと登録できない" do
      @active.way_3 = ""
      @active.valid?
      expect(@active.errors.full_messages).to include("達成したらどんな気持ちになるかを入力してください")
    end
    it "rev_1,rev_2,rev_3,rev_4,がからだとと登録できない" do
      @active.way_1 = ""
      @active.way_2 = ""
      @active.way_3 = ""
      @active.valid?
      expect(@active.errors.full_messages).to include("いつやるのか時間を入力してください", "どこでやるのか場所を入力してください", "達成したらどんな気持ちになるかを入力してください")
    end
  end
end
end
