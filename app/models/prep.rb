class Prep < ApplicationRecord
  belongs_to :user
  has_many :tasks


  with_options presence: true do
    validates :now
    validates :target
  end


end
