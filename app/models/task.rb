class Task < ApplicationRecord
  belongs_to :user
  belongs_to :prep
  has_many :actives
  
  with_options presence: true do
    validates :task_1
    validates :task_2
    validates :task_3
  end
  
end
