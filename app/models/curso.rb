class Curso < ActiveRecord::Base
	validates_presence_of :nome, :valor_inscricao, :periodo, message: 'deve ser preenchido' 
	
	scope :busca, ->(query) {where("nome like ?", "%#{query}%")}
end
