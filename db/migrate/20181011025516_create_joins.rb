class CreateJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :joins do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
      t.index [:user_id, :event_id], unique: true
    end
  end
end
