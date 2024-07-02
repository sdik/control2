class AddContaToRecebiveis < ActiveRecord::Migration[7.0]
  def change
    add_reference :recebiveis, :conta, null: true, foreign_key: true
    add_column :recebiveis, :vencimento, :date
    add_column :recebiveis, :valorpago, :decimal
    add_column :recebiveis, :status, :integer
  end
end
