class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uuid
    end

    add_reference :answers, :device, index: true
  end
end
