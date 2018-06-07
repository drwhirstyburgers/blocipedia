class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis, dependent: :destroy
  has_many :collective_wikis, through: :collaborators, source: :wikis

  after_initialize { self.role ||= :standard }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         authentication_keys: [:login]

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  enum role: [:standard, :premium, :admin]

  def downgrade!
    ActiveRecord::Base.transaction do
      self.update_attribute(:role, :standard)
      self.wikis.where(private: true).all.each do |wiki|
        wiki.update_attribute(:private, false)
      end
    end
  end

  searchable do
    text :username
  end
end
