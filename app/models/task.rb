class Task < ApplicationRecord
    validates :title,:detail, null:false,presence: true, length: { minimum: 1 }
    scope :ordered, -> { order(created_at: :desc) }
end
