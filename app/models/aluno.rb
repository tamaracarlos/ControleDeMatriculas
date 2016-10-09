class Aluno < ActiveRecord::Base
	validates_presence_of :cpf, :rg, :nome, :telefone, :data_nascimento, message: 'deve ser preenchido'

	validates :cpf, :cpf => true
	validates :cpf, 
					length: {is: 11, message: 'deve conter 11 números'},
					uniqueness: {message: 'deve ser único'}

	validates :telefone, 
					length: {maximum: 10, message: 'deve conter no máximo 10 números'}
					
	validates :rg, 
					length: {in: 7..13, message: 'deve conter no entre 9 e 13 números'}

	validate :ano_bissexto

	 def ano_bissexto
 	   if data_nascimento.leap?
 	     errors.add(:data_nascimento, 'Ano bissexto')
 	   end
  	 end


	scope :busca, ->(query) {where("nome like ?", "%#{query}%")}
end
