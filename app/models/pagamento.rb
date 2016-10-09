class Pagamento < ActiveRecord::Base
  belongs_to :matricula
  belongs_to :curso
end
