class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item
      t.text :descricao
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
