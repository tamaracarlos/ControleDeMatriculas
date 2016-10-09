class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.decimal :troco
      t.decimal :dinheiro
      t.references :matricula, index: true, foreign_key: true
      t.references :curso, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
