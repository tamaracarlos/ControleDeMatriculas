class Curso < ActiveRecord::Base
	scope :search, ->(query) {where("nome like ?", "%#{query}%")}
end
