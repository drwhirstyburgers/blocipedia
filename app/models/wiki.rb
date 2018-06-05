class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users, through: :collaborators

  before_save :set_to_false

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  private

  def set_to_false
    if @wiki.private.nil
      self.private == false
    end
  end
end
