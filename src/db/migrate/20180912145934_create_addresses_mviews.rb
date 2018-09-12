class CreateAddressesMviews < ActiveRecord::Migration[5.2]
  def change
    create_view :addresses_mviews, materialized: true
    add_index :addresses_mviews, :address, name: "addresses_mviews_idx", using: :gin, order: { address: :gin_trgm_ops }
  end
end
