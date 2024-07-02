class AddValorpagoToPagamentos < ActiveRecord::Migration[7.0]
  def change
    add_column :pagamentos, :valorpago, :decimal
  end
end
