# frozen_string_literal: true

class RankingService
  attr_reader :model, :params, :rank

  def initialize(params, model: Album)
    @model = model
    @params = params
    @rank = params['rank']
  end

  def order
    params['order'] || 'desc'
  end

  def sort_rank
    case rank
    when 'genre' then sort_genres
    when 'year' then sort_years
    end
  end

  private

  def rankings
    model.count_by(params['rank'])
  end

  def sort_genres
    case order
    when 'asc'
      genres.map { |rank| genre(rank) }
    else
      genres.reverse.map { |rank| genre(rank) }
    end
  end

  def genres
    rankings.sort_by { |_k, v| v }
  end

  def genre(rank)
    { genre: rank[0].name, album_count: rank[1] }
  end

  def sort_years
    case order
    when 'asc'
      years.map { |y| year(y) }.reverse
    else
      years.map { |y| year(y) }
    end
  end

  def years
    group_years.flat_map { |_, year| chronological(year) }
  end

  def chronological(year)
    year.sort { |y1, y2| y2[0] <=> y1[0] }
  end

  def group_years
    sort_year.reverse.group_by { |year_count| year_count[1] }
  end

  def sort_year
    rankings.sort_by { |_k, v| v }
  end

  def year(rank)
    { year: rank[0], album_count: rank[1] }
  end
end
