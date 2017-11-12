class CreateScrollios < ActiveRecord::Migration[5.1]
  def change
    create_table :scrollios do |dolphin|
      dolphin.string :name

      dolphin.timestamps
    end
  end
end