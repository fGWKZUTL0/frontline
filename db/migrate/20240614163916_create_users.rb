class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|

      t.timestamps
    end

    create_table :nurses do |t|

      t.timestamps
    end

    create_table :users do |t|
      t.string :family_name
      t.string :first_name
      t.references :hospital, null: false, foreign_key: true
      t.string :user_model_type
      t.bigint :user_model_id, null: false

      t.timestamps
    end
  end
end
