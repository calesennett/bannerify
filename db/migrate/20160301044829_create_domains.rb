class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name

      t.references :user, index: true, foreign_key: true
      t.references :banner, index: true, foreign_key: true

      t.timestamps
    end
  end
end
