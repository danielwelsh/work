class CreateBaseSchema < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :level
      t.string :room_type
      t.string :dimension

      t.timestamps(null: false)
    end

    create_table :houses do |t|
      t.string :mls_listing_id
      t.integer :property_price
      t.string :street
      t.status :status
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :sq_feet
      t.integer :days_on_market
      t.string :amenities
      t.boolean :balcony
      t.integer :age_of_building
      t.string :parking_type
      t.string :heating
      t.string :basement
      t.string :exterior
      t.string :flooring
      t.string :roofing
      t.string :property_description
      t.integer :agent_id
      t.integer :community_id
      t.integer :building_type_id
      t.integer :province_id
      t.integer :city_id
      t.integer :postal_code_id

      t.timestamps(null: false)

    end

    create_table :provinces do |t|
      t.string :name

      t.timestamps(null: false)
    end

    create_table :cities do |t|
      t.string :name

      t.timestamps(null: false)
    end

    create_table :postal_codes do |t|
      t.string :code

      t.timestamps(null: false)
    end

    create_table :agents do |t|
      t.string :name

      t.timestamps(null: false)
    end

    create_table :communities do |t|
      t.string :name

      t.timestamps(null: false)
    end

    create_table :building_types do |t|
      t.string :name

      t.timestamps(null: false)
    end

    create_table :links do |t|
      t.string :url

      t.timestamps(null: false)
    end

  end
end
