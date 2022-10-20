Apartment.destroy_all

apartments = []

image_list = [
  'https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.unsplash.com/photo-1612637968894-660373e23b03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBhcnRtZW50JTIwYnVpbGRpbmd8ZW58MHx8MHx8&w=1000&q=80',
  'https://im.proptiger.com/1/1493340/6/estate-apartments-elevation-11051772.jpeg',
  'https://www.aveliving.com/AVE/media/Property_Images/Florham%20Park/hero/flor-apt-living-(2)-hero.jpg?ext=.jpg',
  'https://g5-assets-cld-res.cloudinary.com/image/upload/x_0,y_0,h_4907,w_7360,c_crop/q_auto,f_auto,c_fill,g_center,h_400,w_600/v1652204429/g5/g5-c-5lzenrews-olympus-property-management/g5-cl-1k3u37izpu-olympus-property-management/uploads/Building_Eve_04_h6c4ct.jpg',
  'https://images.ctfassets.net/pg6xj64qk0kh/6BOkUsJuFaxNljqKAmLqbj/face0a409d1f56e628f380c657e0b035/camden-buckhead-apartments-atlanta-ga-amenity-deck-building-exterior-and-views-of-downtown-atlanta.JPG?w=1098',
  'https://www.novalifespace.in/blog/wp-content/uploads/2020/08/nova-life-space.jpg',
  'https://images1.apartments.com/i2/3qaSJ8RE61MX7jpOpcY1VvdzYZYaH8w80_IPagi4VCY/117/summerhouse-lakewood-ranch-fl-building-photo.jpg'
]

100.times do |i|
  new_apartment = {
    apartment_name: Faker::Name.last_name,
    location: [ "Ariyalur",
      "Chennai",
      "Coimbatore",
      "Cuddalore",
      "Dharmapuri",
      "Dindigul",
      "Erode",
      "Kanchipuram",
      "Kanyakumari",
      "Karur",
      "Krishnagiri",
      "Madurai",
      "Nagapattinam",
      "Namakkal",
      "Nilgiris",
      "Perambalur",
      "Pudukkottai",
      "Ramanathapuram",
      "Salem",
      "Sivaganga",
      "Thanjavur",
      "Theni",
      "Thoothukudi",
      "Tiruchirappalli",
      "Tirunelveli",
      "Tiruppur",
      "Tiruvallur",
      "Tiruvannamalai",
      "Tiruvarur",
      "Vellore",
      "Viluppuram",
      "Virudhunagar"
      ].sample,
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
    posted_date: Date.today,
    owner_id: [1,2,3].sample
  }
  apartments.push(new_apartment)
end

Apartment.create(apartments)
