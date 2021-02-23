class CreateSquareRoots < ActiveRecord::Migration[6.0]
  def change
    create_table :square_roots do |t|
      t.float :num
      t.string :res

      t.timestamps
    end
    add_index :square_roots, :num, unique: true
  end
end
