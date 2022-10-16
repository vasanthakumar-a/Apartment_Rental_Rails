Apartment.destroy_all

apartments = []

20.times do |i|
  new_apartment = {
    apartment_name: Faker::Name.last_name,
    location: ['chennai','coimbatore','madurai','trichy','salem'].sample,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    deposit: rand(100000..20000000),
    rent: rand(10000..50000),
    room_size: [1000,2000,500,1500].sample,
    review: 5,
    bedrooms: [2,3].sample,
    tenant: ['Family','Bacholers','Both'].sample,
    building_age: [5,10,15,20].sample,
    balcony: [1,2].sample,
    furnishing_status: ['Fullyfurnished','Semifurnished','no'].sample,
    bathrooms: [1,2].sample,
    property_type: ['Apartment','Independent House'].sample,
    lift: [true,false].sample,
    wifi: [true,false].sample,
    ac: [true,false].sample,
    fire_safety: [true,false].sample,
    security: [true,false].sample,
    house_keeping: [true,false].sample,
    water_supply: [true,false].sample,
    parking: [true,false].sample,
    sewage: [true,false].sample,
    posted_date: Date.today
  }
  apartments.push(new_apartment)
end

Apartment.create(apartments)
