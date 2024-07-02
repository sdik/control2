Trestle.resource(:recebiveis) do
  menu do
    item :recebiveis, icon: "fa fa-money"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :pessoa, sort: :nome do |recebiveis|
      recebiveis.pessoa.nome if recebiveis.pessoa.present?
    end
    column :vencimento, align: :right, sort: :vencimento do |recebiveis|
      recebiveis.vencimento.strftime('%d/%m/%y') if recebiveis.vencimento.present?
    end
     column :valor, format: :currency
     actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |recebivel|
    collection_select :pessoa_id, Pessoa.all, :id, :nome, label: "Pessoa"
    number_field :valor, format: :currency
    date_field :vencimento
  #   text_field :name
  # 
  sidebar do
 
    date_field :data_recebimento
    collection_select :conta_id, Conta.all, :id, :nome, include_blank: true   
    text_field :valorpago, label: "Valor Pago", help: "Insira o valor pagamento final"
    select :status, { "Aberto" => :aberto, "Fechado" => :fechado } 
  end
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:recebivel).permit(:name, ...)
  # end
end 

