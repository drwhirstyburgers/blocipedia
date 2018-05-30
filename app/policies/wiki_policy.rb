class WikiPolicy < ApplicationPolicy
    attr_reader :user, :post

    def initialize(user, wiki)
      @user = user
      @wiki = wiki
    end

    def update?
      user.present?
    end
  end
