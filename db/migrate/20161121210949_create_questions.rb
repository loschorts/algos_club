class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
