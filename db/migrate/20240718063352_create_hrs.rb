class CreateHrs < ActiveRecord::Migration[7.1]
  def change
    create_table :hrs do |t|
      t.string :name
      t.string :email
      t.string :status
      t.string :phone_number
      t.string :password_digest
      t.string :password_confirmation
      t.timestamps
    end
  end
end
