class CreateBaseSchema < ActiveRecord::Migration
  def change
    create_table :houses_rooms do |t|
      t.text :level
      t.text :dimension
      t.references :roomtype
      t.references :house

      t.timestamps(null: false)
    end

    create_table :room_types do |t|
      t.text :name_room_type

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
      t.references :agent
      t.references :community
      t.references :buildingtype
      t.references :province
      t.references :city
      t.references :postalcode

      t.timestamps(null: false)
    end

    create_table :provinces do |t|
      t.text :name_province

      t.timestamps(null: false)
    end

    create_table :cities do |t|
      t.text :name_city

      t.timestamps(null: false)
    end

    create_table :postal_codes do |t|
      t.text :code

      t.timestamps(null: false)
    end

    create_table :agents do |t|
      t.text :name_agent

      t.timestamps(null: false)
    end

    create_table :communities do |t|
      t.text :name_community

      t.timestamps(null: false)
    end

    create_table :building_types do |t|
      t.text :name_building_type

      t.timestamps(null: false)
    end

    create_table :links do |t|
      t.text :url

      t.timestamps(null: false)
    end



  end
end
