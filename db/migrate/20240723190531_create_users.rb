class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :phone_number
      t.string :job
      t.date :date_of_birth
      t.string :email
      t.string :gender

      t.timestamps
    end
  end
end
