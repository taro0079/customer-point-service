class AddJancodeToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :jancode, :string
  end
end
