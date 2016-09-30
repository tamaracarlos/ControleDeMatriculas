class Matricula < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :curso

  validates_presence_of :data_matricula, :ano, :pago, :aluno, :curso, message: 'deve ser preenchido' 
  validates :aluno, uniqueness: { scope: :curso, scope: :ano, message: 'já matriculado.' }
end
