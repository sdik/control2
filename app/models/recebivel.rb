class Recebivel < ApplicationRecord
  belongs_to :pessoa
  enum :status, [ :aberto, :fechado ]
end
