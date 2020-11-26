require 'rails_helper'

RSpec.describe Prep, type: :model do
      before do
        @prep = FactoryBot.build(:prep)
      end
    

  describe 'prepモデルについて' do
    context '現実と夢の記述がうまくいくとき' do
      it "now,target両方あると登録できる" do
        expect(@prep).to be_valid
      end
    end

    context '現実と夢の記述がうまくいかないとき' do
      it "現実がからの場合登録できない" do
        @prep.now = ""
        @prep.valid?
        expect(@prep.errors.full_messages).to include("途中の気持ちを入力してください")
      end
      it "夢がからの場合登録できない" do
        @prep.target = ""
        @prep.valid?
        expect(@prep.errors.full_messages).to include("達成した気持ちを入力してください")
      end
      it "現実と夢がからの場合登録できない" do
        @prep.now = ""
        @prep.target = ""
        @prep.valid?
        expect(@prep.errors.full_messages).to include("途中の気持ちを入力してください", "達成した気持ちを入力してください")
      end
    end
  end
end
