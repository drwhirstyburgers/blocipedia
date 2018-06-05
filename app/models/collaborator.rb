class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :wikis
end
