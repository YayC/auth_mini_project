class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :value
      t.datetime :expiration

      t.timestamps
    end
  end
end
