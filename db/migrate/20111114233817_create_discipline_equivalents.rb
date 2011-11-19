class CreateDisciplineEquivalents < ActiveRecord::Migration
  def change
    create_table :discipline_equivalents do |t|
      t.integer :discipline_id
      t.integer :equivalent_discipline_id

      t.timestamps
    end
  end
end
