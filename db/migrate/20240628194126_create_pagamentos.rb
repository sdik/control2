class CreatePagamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :pagamentos do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.string :descricao
      t.decimal :valor
      t.date :data_recebimento

      t.timestamps
    end
  end
end
