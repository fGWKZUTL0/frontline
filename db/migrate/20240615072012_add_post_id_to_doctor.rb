class AddPostIdToDoctor < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :order_num
      t.integer :category_code

      t.timestamps
    end

    add_reference :doctors, :position, null: false, foreign_key: { to_table: :services }
    add_reference :nurses, :position, null: false, foreign_key: { to_table: :services }
  end
end
