class Prep < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :actives
  has_many :reviews

  with_options presence: true do
    validates :now
    validates :target
  end


end
