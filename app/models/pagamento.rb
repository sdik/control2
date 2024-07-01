class Pagamento < ApplicationRecord
  belongs_to :pessoa
  scope :ordered_by_pessoa_name, -> { joins(:pessoa).order('pessoas.nome ASC') }
end
