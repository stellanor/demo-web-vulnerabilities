class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :github_username, null: false
      t.boolean :passed_assessment, default: false
    end
  end
end
