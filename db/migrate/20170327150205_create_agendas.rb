class CreateAgendas < ActiveRecord::Migration[5.0]
  def change
    create_table :agendas do |t|
      t.references :restaurant, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
