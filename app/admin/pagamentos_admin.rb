Trestle.resource(:pagamentos) do
  menu do
    item :pagamentos, icon: "fa fa-barcode"
  end
  scope :aberto, -> { Pagamento.where(status: :aberto) }, default: true
  scope :vencidos, -> { Pagamento.where(status: :aberto).where('data_vencimento < ?', Date.today) }
  scope :vence_hoje, -> { Pagamento.where(status: :aberto).where('data_vencimento = ?', Date.today) }
  scope :fechado, -> { Pagamento.where(status: :fechado)}
  # Customize the table columns shown on the index view.
  #
  table do
    column :id
    column :pessoa, sort: :nome do |pagamentos|
      pagamentos.pessoa.nome if pagamentos.pessoa.present?
    end
     column :descricao
     column :valor, align: :right, format: :currency
     column :data_vencimento, align: :right, sort: :data_vencimento do |pagamento|
      pagamento.data_vencimento.strftime('%d/%m/%y') if pagamento.data_vencimento.present?
    end
     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
  form do |pagamento|
  #   text_field :name
      collection_select :pessoa_id, Pessoa.all, :id, :nome, label: "Pessoa"
      text_field :descricao
      date_field :data_vencimento
      text_field :valor, label: "Valor", format: :currency, help: "Insira o valor da transação"

      #select :status, { "Aberto" => :aberto, "Fechado" => :fechado }
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
      sidebar do
       
        date_field :data_pagamento
        collection_select :conta_id, Conta.all, :id, :nome, include_blank: true   
        text_field :valorpago, label: "Valor Pago", help: "Insira o valor pagamento final"
        select :status, { "Aberto" => :aberto, "Fechado" => :fechado }
      end
   end

   
  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:pagamento).permit(:name, ...)
  # end
end
