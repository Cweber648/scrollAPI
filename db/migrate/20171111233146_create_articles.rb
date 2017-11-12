class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |panda|
      panda.string :url

      panda.integer :scrollio_id
      panda.timestamps
    end
  end
end
