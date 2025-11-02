class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.date :date_of_birth
      t.text :address
      t.string :phone
      t.date :enrollment_date

      t.timestamps
    end
  end
end
