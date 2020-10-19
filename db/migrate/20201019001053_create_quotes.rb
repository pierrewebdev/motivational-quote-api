class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :content
      t.string :author
      #switched null to true to allow quote to exist with no user
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
