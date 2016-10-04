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

	# before_validation :data_nascimento, :if => :ano_bissexto? , message: 'ano bissexto'		

	# def ano_bissexto?	
	# 	 data_nascimento.leap? == true
	# end

	# scope :search, ->(query) {where("nome like ?", "%#{query}%")}
end
