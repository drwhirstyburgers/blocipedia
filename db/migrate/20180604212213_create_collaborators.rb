class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :wikis, foreign_key: true

      t.timestamps
    end
  end
end
