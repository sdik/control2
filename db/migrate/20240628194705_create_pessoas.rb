class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :email
      t.string :telefone
      t.string :cnpj_cpf

      t.timestamps
    end
  end
end