class Pedido < ApplicationRecord
    has_many :items, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
end
