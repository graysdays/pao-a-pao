class DropAgendas < ActiveRecord::Migration[5.0]
  def change
    drop_table :agendas
  end
end
