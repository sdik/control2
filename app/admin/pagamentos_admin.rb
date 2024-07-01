Trestle.resource(:pagamentos) do
  menu do
    item :pagamentos, icon: "fa fa-star"
  end
  scope :aberto, -> { Pagamento.where(status: :aberto) }, default: true
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
     column :data_recebimento
     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
  form do |pagamento|
  #   text_field :name
      collection_select :pessoa_id, Pessoa.all, :id, :nome, label: "Pessoa"
      text_field :descricao
      text_field :valor, label: "Valor", help: "Insira o valor da transação"

      #select :status, { "Aberto" => :aberto, "Fechado" => :fechado }
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
      sidebar do
        select :status, { "Aberto" => :aberto, "Fechado" => :fechado }
        date_field :data_recebimento
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
