# frozen_string_literal: true

# last updated 2019-01-29

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 0
  config.order = :random
  Kernel.srand config.seed
end

def year_payload
  { 1987 => 3, 1970 => 1, 1978 => 1, 2006 => 1, 1975 => 1, 1993 => 2, 1980 => 1, 2013 => 4, 1986 => 1, 1972 => 1, 1959 => 2, 2007 => 2, 1984 => 2, 2011 => 1, 1979 => 2 }
end

def genre_payload
  { double('Genre', id: 43, name: 'Pop') => 9, double('Genre', id: 45, name: 'Dance') => 4, double('Genre', id: 46, name: 'Rock') => 20, double('Genre', id: 48, name: 'Jazz') => 4 }
end

def sorted_by_year_desc
  [
    { album_count: 4, year: 2013 },
    { album_count: 3, year: 1987 },
    { album_count: 2, year: 2007 },
    { album_count: 2, year: 1993 },
    { album_count: 2, year: 1984 },
    { album_count: 2, year: 1979 },
    { album_count: 2, year: 1959 },
    { album_count: 1, year: 2011 },
    { album_count: 1, year: 2006 },
    { album_count: 1, year: 1986 },
    { album_count: 1, year: 1980 },
    { album_count: 1, year: 1978 },
    { album_count: 1, year: 1975 },
    { album_count: 1, year: 1972 },
    { album_count: 1, year: 1970 }
  ]
end

def sorted_by_year_asc
  [{ album_count: 1, year: 1970 }, { album_count: 1, year: 1972 }, { album_count: 1, year: 1975 }, { album_count: 1, year: 1978 }, { album_count: 1, year: 1980 }, { album_count: 1, year: 1986 }, { album_count: 1, year: 2006 }, { album_count: 1, year: 2011 }, { album_count: 2, year: 1959 }, { album_count: 2, year: 1979 }, { album_count: 2, year: 1984 }, { album_count: 2, year: 1993 }, { album_count: 2, year: 2007 }, { album_count: 3, year: 1987 }, { album_count: 4, year: 2013 }]
end

def sorted_by_genre_desc
  [
    { album_count: 20, genre: 'Rock' },
    { album_count: 9, genre: 'Pop' },
    { album_count: 4, genre: 'Jazz' },
    { album_count: 4, genre: 'Dance' }
  ]
end

def sorted_by_genre_asc
  [{ album_count: 4, genre: 'Dance' },
   { album_count: 4, genre: 'Jazz' },
   { album_count: 9, genre: 'Pop' },
   { album_count: 20, genre: 'Rock' }]
end
