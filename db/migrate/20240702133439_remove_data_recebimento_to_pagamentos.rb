class RemoveDataRecebimentoToPagamentos < ActiveRecord::Migration[7.0]
  def change
    remove_column :pagamentos, :data_recebimento, :date
    add_column :pagamentos, :data_vencimento, :date
    add_column :pagamentos, :data_pagamento, :date
  end
end
