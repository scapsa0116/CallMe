class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :busness_email
      t.string :title
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
