class AddScaleToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :value, :integer
  end
end
