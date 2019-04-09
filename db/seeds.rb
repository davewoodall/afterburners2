# frozen_string_literal: true

[Artist, Genre, Album].each(&:destroy_all)

path = File.join(Rails.root, 'lib', 'assets', 'albums.csv')
csv = File.read(path)

CSV.parse(csv, headers: true).each do |row|
  params = {
    'name' => row['album'],
    'year' => row['year'],
    'artist_attributes' => { 'name' => row['artist'] },
    'genre_attributes' => { 'name' => row['genre'] }
  }
  AlbumFormService.new(params).call
end

puts 'SEEDED!'
