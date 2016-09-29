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

	# validates_presence_of :data_nascimento, :if => :ano_bissexto?
			
	 	
	# def ano_bissexto? 
	# 	if data_nascimento == "2008-02-02"
	# 	  puts "Ano Bissexto"		   
	# 	end
	# end

end
