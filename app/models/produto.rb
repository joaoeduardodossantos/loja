class Produto < ApplicationRecord
	belongs_to :departamentos

	validates :preco, presence: true
	validates :nome, length: {minimum: 4}
end
