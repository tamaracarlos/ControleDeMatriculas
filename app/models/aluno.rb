class Aluno < ActiveRecord::Base
	validates_presence_of :cpf, :rg, :nome, :telefone, message: 'deve ser preenchido'

	validates :cpf, :cpf => true
	validates :cpf, 
					length: {is: 11, message: 'deve conter 11 números'},
					uniqueness: {message: 'deve ser único'}

	validates :telefone, 
					length: {maximum: 10, message: 'deve conter no máximo 10 números'}
					
	validates :rg, 
					length: {maximum: 10, message: 'deve conter no máximo 10 números'}	

	validate :ano_bissexto

	# def ano_bissexto
	#   if data_nascimento.leap?
	#     errors.add(:data_nascimento, 'Ano bissexto')
	#   end
	# end

	def ano_bissexto
 		if data_nascimento.year%4 == 0 && data_nascimento.year%100 != 0  
    		true
 		elsif data_nascimento.year%400 == 0 
    		true
 		elsif data_nascimento.year%4 == 0 && data_nascimento.year%100 == 0 && data_nascimento.year%400 != 0 
    		false
  		elsif data_nascimento.year%4 != 0 
    		false
  		end
  		errors.add(:data_nascimento, 'Ano bissexto')
	end 

	# scope :search, ->(query) {where("nome like ?", "%#{query}%")}
end
