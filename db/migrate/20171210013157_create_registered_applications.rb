 class CreateRegisteredApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :URL
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
