class CreateContas < ActiveRecord::Migration[7.0]
  def change
    create_table :contas do |t|
      t.string :nome
      t.string :tipo
      t.decimal :saldo

      t.timestamps
    end
  end
end
