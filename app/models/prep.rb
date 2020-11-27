class Prep < ApplicationRecord
  belongs_to :user
  has_many :tasks,dependent: :destroy
  has_many :actives,dependent: :destroy
  has_many :reviews,dependent: :destroy

  with_options presence: true do
    validates :now
    validates :target
  end


end
