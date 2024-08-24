class CreateSecuredAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :secured_assets do |t|
      t.string :account_number
      t.integer :account_balance

      t.timestamps
    end
  end
end
