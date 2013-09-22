# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Service.create(name: 'Incas Of Peru', brief_description: 'As a native of this country and having experience growing up locally, I can provide language translation services as well as take you around to the major attractions. For an extra fee, I can also arrange transportation from Lima',long_description: 'As a native of this country and having experience growing up locally, I can provide language translation services as well as take you around to the major attractions. For an extra fee, I can also arrange transportation from Lima', fee: 200.0, zip_code: 00000, location: 'Lima, Peru', picture_url: 'http://upload.wikimedia.org/wikipedia/commons/5/52/Lima_Peru_HDR.jpg', user_id:3)
Service.create(name: 'Alcatraz Island', brief_description: 'Half day tour of one of the best attractions near SF',long_description: 'Often referred to as "The Rock", the small island was developed with facilities for a lighthouse, a military fortification, a military prison (1868), and a federal prison from 1933 until 1963.Beginning in November 1969, the island was occupied for more than 19 months by a group of Aboriginal peoples from San Francisco who were part of a wave of Native activism across the nation with public protests through the 1970s. In 1972, Alcatraz became a national recreation area and received designation as a National Historic Landmark in 1986.', fee: 100.0, zip_code: 94101, location: 'San Francisco, CA', picture_url: 'http://www.alcatrazcruises.com/website/images/homepage/content-img.jpg', user_id:1)
Service.create(name: 'Pittsburgh Tour', brief_description: 'A tour of the steel city and the best places to hang out',long_description:'The city also features 29 skyscrapers, two inclined railways, a pre-revolutionary fortification, and the source of the Ohio at the confluence of the Monongahela and Allegheny', fee: 50.0, zip_code: 15213, location: 'Pittsburgh, PA', picture_url: 'http://www.vmi.pitt.edu/images-t/Pittsburgh.jpg', user_id:1)
Service.create(name: 'Alcatraz Island', brief_description: 'Full day tour of one of the best attractions near SF',long_description: 'Often referred to as "The Rock", the small island was developed with facilities for a lighthouse, a military fortification, a military prison (1868), and a federal prison from 1933 until 1963.Beginning in November 1969, the island was occupied for more than 19 months by a group of Aboriginal peoples from San Francisco who were part of a wave of Native activism across the nation with public protests through the 1970s. In 1972, Alcatraz became a national recreation area and received designation as a National Historic Landmark in 1986.', fee: 200.0, zip_code: 94101, location: 'San Francisco, CA', picture_url: 'http://www.alcatrazcruises.com/website/images/homepage/content-img.jpg', user_id:1)
Service.create(name: 'San Francisco City Tour', brief_description: 'Full day tour of SF including the Piers, Golden Gate bridge and the best places to explore the city',long_description: 'San Francisco is a major city in California, the centerpiece of the Bay Area, well-known for its liberal community, hilly terrain, Victorian architecture, scenic beauty, summer fog, and great ethnic and cultural diversity. These are only a few of the aspects of the city that make San Francisco one of the most visited cities in the world.', fee: 200.0, zip_code: 94101, location: 'San Francisco, CA', picture_url: 'http://upload.wikimedia.org/wikipedia/en/7/75/DowntownSF.jpg', user_id:2)
Service.create(name: 'Golden Gate Bridge', brief_description: 'Golden Gate bridge is certainly a must-see attraction',long_description: 'One of the major attractions of San Francisco and a beautiful sight. During this sunset tour, I will show you some of the lesser known points to view this bridge', fee: 20.0, zip_code: 94129, location: 'San Francisco, CA', picture_url: 'http://s3-media3.ak.yelpcdn.com/bphoto/K62sZJLlcx_Lsz9dxiJZFA/l.jpg', user_id:2)
Service.create(name: 'Castro Street', brief_description: 'Friday night at Castro street',long_description: 'Few people realize how much fun Castro street can be on a weekend. I can show you around the best places to hang out', fee: 10.0, zip_code: 94043, location: 'Mountain View, CA', picture_url: 'http://www.terragalleria.com/images/us-ca/usca35127.jpeg', user_id:4)

Review.create(user_id:3, reviewerid:4, comment: 'I would never have been able to manage without knowing the local language. Thanks for the help.Very reasonable charges', customerreview: false, rating: 5, reviewdate: '2013-01-01')
Review.create(user_id:1, reviewerid:2, comment: 'Seemed to know the city very well. Pittsburgh is beautiful', customerreview: false, rating: 5, reviewdate: '2013-04-04')
Review.create(user_id:1, reviewerid:4, comment: 'Alcatraz Island is nothing new, boring place. Guide seemed to be lost', customerreview: false, rating: 2, reviewdate: '2013-01-31')
Review.create(user_id:1, reviewerid:5, comment: 'Waste of money to take the Alcatraz Island tour', customerreview: false, rating: 1, reviewdate: '2013-07-11')
Review.create(user_id:2, reviewerid:5, comment: 'Recommended if you are new to SF area', customerreview: false, rating: 5, reviewdate: '2013-06-01')
Review.create(user_id:2, reviewerid:4, comment: 'Nice tour of the area', customerreview: false, rating: 5, reviewdate: '2013-02-12')
Review.create(user_id:2, reviewerid:1, comment: 'I liked the tour and the guide', customerreview: false, rating: 5, reviewdate: '2013-06-01')
Review.create(user_id:2, reviewerid:6, comment: 'The place was cloudy and we did not see much, but good services', customerreview: false, rating: 4, reviewdate: '2013-02-12')
Review.create(user_id:4, reviewerid:6, comment: 'We had fun hanging out together', customerreview: false, rating: 4, reviewdate: '2013-02-12')

User.create(:password => '123456',:email=>'test1@mitra.com', :picture_url => 'http://farm3.static.flickr.com/2137/2327330969_f94492cdaf_o.jpg')
User.create(:password => '123456',:email=>'test2@mitra.com', :picture_url => 'http://www.degreedriven.com/images/topcities/C5NDG1V582P.jpg')
User.create(:password => '123456',:email=>'test3@mitra.com', :picture_url => 'http://farm3.static.flickr.com/2137/2327330969_f94492cdaf_o.jpg')
User.create(:password => '123456',:email=>'test4@mitra.com', :picture_url => 'http://s3-media3.ak.yelpcdn.com/bphoto/K62sZJLlcx_Lsz9dxiJZFA/l.jpg')
User.create(:password => '123456',:email=>'test5@mitra.com', :picture_url => 'http://www.nps.gov/samo/naturescience/images/Zuma-Beach-and-Mountain-View.jpg')
User.create(:password => '123456',:email=>'test6@mitra.com', :picture_url => 'http://www.photoinpixel.com/mypicture/beautiful-mountain-view.jpg')


