class CreateBaseSchema < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :level
      t.text :room_type
      t.text :dimension

      t.timestamps(null: false)
    end

    create_table :houses do |t|
      t.text :mls_listing_id
      t.integer :property_price
      t.text :street
      t.text :status
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :sq_feet
      t.integer :days_on_market
      t.text :amenities
      t.text :balcony
      t.integer :age_of_building
      t.text :parking_type
      t.text :heating
      t.text :basement
      t.text :exterior
      t.text :flooring
      t.text :roofing
      t.text :property_description
      t.integer :agent_id
      t.integer :community_id
      t.integer :building_type_id
      t.integer :province_id
      t.integer :city_id
      t.integer :postal_code_id

      t.timestamps(null: false)

    end

    create_table :provinces do |t|
      t.text :name

      t.timestamps(null: false)
    end

    create_table :cities do |t|
      t.text :name

      t.timestamps(null: false)
    end

    create_table :postal_codes do |t|
      t.text :code

      t.timestamps(null: false)
    end

    create_table :agents do |t|
      t.text :name

      t.timestamps(null: false)
    end

    create_table :communities do |t|
      t.text :name

      t.timestamps(null: false)
    end

    create_table :building_types do |t|
      t.text :name

      t.timestamps(null: false)
    end

    create_table :links do |t|
      t.text :url

      t.timestamps(null: false)
    end

  end
end
