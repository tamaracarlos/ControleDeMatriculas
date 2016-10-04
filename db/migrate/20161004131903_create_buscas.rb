class CreateBuscas < ActiveRecord::Migration
  def change
    create_table :buscas do |t|
      t.references :aluno, index: true, foreign_key: true
      t.references :curso, index: true, foreign_key: true
      t.references :matricula, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
