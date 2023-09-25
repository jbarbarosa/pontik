class CreateClocks < ActiveRecord::Migration[7.0]
  def change
    create_table :clocks do |t|
      t.datetime :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
