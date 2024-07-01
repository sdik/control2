class CreateRecebiveis < ActiveRecord::Migration[7.0]
  def change
    create_table :recebiveis do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.decimal :valor
      t.date :data_recebimento

      t.timestamps
    end
  end
end
