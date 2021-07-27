class Task < ApplicationRecord
    validates :title,:detail, null:false,presence: true, length: { minimum: 1 }
    enum status: {
        unstarted: 0,
        in_progress: 1,
        completed: 2
    }
    enum priority: {
        Low: 0,
        Medium:1,
        High: 2
    }
    scope :ordered, -> { order(created_at: :desc) }
    scope :orderByDeadline,->{order(deadline: :desc) }
    scope :orderByPriority,->{order(priority: :desc) }
    
    scope :status_sort, -> (search_status){ where(status: search_status) }

    scope :search_sort, -> (search_word){ where('title LIKE ?', "%#{search_word}%") }

    scope :priority_sort, -> (search_priority){ where(priority: search_priority) }

  # kaminari関連
  scope :kaminari, -> (kaminari_page){ page(kaminari_page).per(5) }
end
