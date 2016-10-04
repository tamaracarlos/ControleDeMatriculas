class Busca < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :curso
  belongs_to :matricula
end
