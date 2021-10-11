class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :board_nm
      t.string :board_description
      t.string :board_logo
      t.string :string

      t.timestamps
    end
  end
end
