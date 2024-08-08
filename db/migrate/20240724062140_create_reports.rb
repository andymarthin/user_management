class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.integer :status
      t.text :file_data

      t.timestamps
    end
  end
end
