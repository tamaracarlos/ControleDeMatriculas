class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.decimal :valor_inscricao
      t.integer :periodo

      t.timestamps null: false
    end
  end
end
