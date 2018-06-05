class Wiki < ApplicationRecord
  belongs_to :user, required: false
  has_many :users, through: :collaborators

  before_save { self.private == false }

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
