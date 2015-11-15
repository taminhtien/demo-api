class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :type
      t.timestamps null: false
    end
  end
end
