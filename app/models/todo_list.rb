class TodoList < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy

  validates :title, presence: true

  enum status: { todo: 0, in_progress: 1, completed: 2 }
  enum priority: { high: 0, medium: 1, low: 2 }
end
