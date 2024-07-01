class AddStatusToPagamentos < ActiveRecord::Migration[7.0]
  def change
    add_column :pagamentos, :status, :integer
  end
end
