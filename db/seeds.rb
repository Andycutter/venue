# frozen_string_literal: true

Campaign.destroy_all
Genre.destroy_all
User.destroy_all

fan = User.create(email: 'fan@venue.se', password: 'my-password', role: 'fan')
artist = User.create(email: 'artist@venue.se', password: 'my-password', role: 'artist')
admin = User.create(email: 'admin@venue.se', password: 'my-password', role: 'admin')

rock = Genre.create(name: 'rock')
metal = Genre.create(name: 'metal')
punk = Genre.create(name: 'punk')
indie = Genre.create(name: 'indie')
pop = Genre.create(name: 'pop')
electronic = Genre.create(name: 'electronic')
hiphop = Genre.create(name: 'hip hop')
rap = Genre.create(name: 'rap')
classic = Genre.create(name: 'classic')
country = Genre.create(name: 'country')
jazz = Genre.create(name: 'jazz')
blues = Genre.create(name: 'blues')


# Artists
clare = artist.performers.create(
  name: 'Clare Cunningham',
  genres: [rock],
  city: 'Stockholm',
  description: 'Dubbed as having a vocal register similar to Adele (GAFFA) and for having a "Powerfull and killer voice" from Lzzy Hale (Halestorm) and Phil Campell (Motörhead) it is no wonder Clare Cunningham is making waves across the world with her music. Storytelling with unwavering honesty is what Cunningham is best at, and this little country rock/pop chick has proven she is a multi versatile recording and live artist, singing across many genres.',
  facebook: 'https://www.facebook.com',
  instagram: 'https://www.instagram.com',
  twitter: 'https://www.twitter.com',
  youtube: 'https://www.youtube.com',
  website: 'https://www.google.com',
  spotify: 'https://www.spotify.com',
  state: 'active'
)

clare.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: 'image.jpg', content_type: 'image/jpg')
clare.background_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'background_image.jpg')), filename: 'image.jpg', content_type: 'image/jpg')

beyonce = artist.performers.create(
  name: 'Beyonce',
  genres: [pop],
  city: 'Los Angeles',
  description: "Beyoncé Giselle Knowles-Carter is an American singer, songwriter, performer, and actress. Born and raised in Houston, Texas, Beyoncé performed in various singing and dancing competitions as a child. She rose to fame in the late 1990s as lead singer of the R&B girl-group Destiny's Child.",
  facebook: 'https://www.facebook.com',
  instagram: 'https://www.instagram.com',
  twitter: 'https://www.twitter.com',
  youtube: 'https://www.youtube.com',
  website: 'https://www.google.com',
  spotify: 'https://www.spotify.com',
  state: 'active'
)

beyonce.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'beyonce.jpg')), filename: 'image.jpg', content_type: 'image/jpg')
beyonce.background_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'beyonce_background.jpg')), filename: 'image.jpg', content_type: 'image/jpg')

stevie_wonder = artist.performers.create(
  name: 'Stevie Wonder',
  genres: [rock],
  city: 'Stockholm',
  description: 'Stevie Wonder is an American singer, songwriter, record producer, and multi-instrumentalist. A child prodigy, he is considered to be one of the most critically and commercially successful musical performers of the late 20th century.',
  facebook: 'https://www.facebook.com',
  instagram: 'https://www.instagram.com',
  twitter: 'https://www.twitter.com',
  youtube: 'https://www.youtube.com',
  website: 'https://www.google.com',
  spotify: 'https://www.spotify.com',
  state: 'active'
)
stevie_wonder.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'stevie_wonder.jpg')), filename: 'image.jpg', content_type: 'image/jpg')
stevie_wonder.background_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'stevie_wonder_background.jpg')), filename: 'image.jpg', content_type: 'image/jpg')


michael_buble = artist.performers.create(
  name: 'Michael Buble',
  genres: [jazz],
  city: 'Burnaby',
  description: 'Michael Steven Bublé is a Canadian-Italian singer, songwriter, actor and record producer. He has won several awards, including four Grammy Awards and multiple Juno Awards. His first album reached the top ten in Canada and the UK.',
  facebook: 'https://www.facebook.com',
  instagram: 'https://www.instagram.com',
  twitter: 'https://www.twitter.com',
  youtube: 'https://www.youtube.com',
  website: 'https://www.google.com',
  spotify: 'https://www.spotify.com',
  state: 'active'
)

michael_buble.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'michael_buble.png')), filename: 'image.jpg', content_type: 'image/png')
michael_buble.background_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'michael_buble_background.jpg')), filename: 'image.jpg', content_type: 'image/jpg')

katy_perry = artist.performers.create(
  name: 'Katy Perry',
  genres: [pop],
  city: 'New York',
  description: 'Katheryn Elizabeth Hudson, known professionally as Katy Perry, is an American singer, songwriter, and television personality. After singing in church during her childhood, she pursued a career in gospel music as a teenager.',
  facebook: 'https://www.facebook.com',
  instagram: 'https://www.instagram.com',
  twitter: 'https://www.twitter.com',
  youtube: 'https://www.youtube.com',
  website: 'https://www.google.com',
  spotify: 'https://www.spotify.com',
  state: 'active'
)

katy_perry.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'katy_perry.jpg')), filename: 'image.jpg', content_type: 'image/jpg')
katy_perry.background_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'katy_perry_background.jpg')), filename: 'image.jpg', content_type: 'image/jpg')

# Campaigns
kim_larsen_campaign = Campaign.create(
  title: 'Kim Larsen',
  genres: [rock, pop],
  description: 'Larsen has many times voiced his opposition to the established society and instead advocated the right to be different from the mainstream: The album and movie Midt om natten revolves around this subject - in fact you can compare the movie action to the real Danish BZ movement da:BZ, Sorte Hest and also Freetown Christiania, located in Copenhagen. The same opposition is also shown by the album 231045-0637 - the title is Kim Larsen’s social security number which is strictly personal. Larsen was against the big database of every citizen, implied by this title.',
  location: 'Copenhagen',
  state: 'accepted',
  user: artist,
  event_date: '2019-03-10'
)

kim_larsen_campaign.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'kim_larsen.jpg')), filename: 'kim_larsen.jpg', content_type: 'image/jpg')

clare_campaign = Campaign.create(
  title: 'Clare Cunningham',
  genres: [pop],
  description: 'Dubbed as having a vocal register similar to Adele (GAFFA) and for having a "Powerfull and killer voice" from Lzzy Hale (Halestorm) and Phil Campell (Motörhead) it is no wonder Clare Cunningham is making waves across the world with her music. Storytelling with unwavering honesty is what Cunningham is best at, and this little country rock/pop chick has proven she is a multi versatile recording and live artist, singing across many genres.',
  location: 'Stockholm',
  state: 'accepted',
  user: artist,
  event_date: '2019-01-10'
)

clare_campaign.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: 'clare_campaign.jpg', content_type: 'image/jpg')

Campaign.all.each do |campaign|
  ticket = campaign.tickets.create(price: 200)
  ticket.ticket_variants.create(name: 'Gig Starter', base_price_percentage: 50)
  ticket.ticket_variants.create(name: 'Game Changer', base_price_percentage: 75)
  ticket.ticket_variants.create(name: 'Sure Thing', base_price_percentage: 100)
end
