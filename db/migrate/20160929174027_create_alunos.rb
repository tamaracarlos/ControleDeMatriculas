class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :cpf
      t.integer :rg
      t.date :data_nascimento
      t.string :nome
      t.string :telefone

      t.timestamps null: false
    end
  end
end
