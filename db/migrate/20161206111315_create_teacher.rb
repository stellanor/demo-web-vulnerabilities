class CreateTeacher < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :username, null: false
      t.string :name, null: false
      t.string :hashed_password, null: false
    end
  end
end
