class OMDBAdapter
  $OMDB_QUERY_PATH = "http://www.omdbapi.com/"

  def get_omdb_data(q)
    uri = URI($OMDB_QUERY_PATH)
    uri.query = URI.encode_www_form(q)
    JSON.parse(Net::HTTP.get(uri))
  end

  def handle_series(show_name)
    omdb_data = get_omdb_data(s: show_name)
    series_data = omdb_data['Search'].select{|data| data["Type"] == "series"}.first.symbolize_keys
    # Find if such series exists
    series = Series.where(imdb_id: series_data[:imdbID]).first
    if series.blank?
      # No? create one
      series = Series.create!(name: series_data[:Title], imdb_id: series_data[:imdbID], year: series_data[:Year])

      omdb_data = get_omdb_data(i: series.imdb_id)
      series.actors = omdb_data["Actors"]
      series.plot = omdb_data["Plot"]
      series.poster_url = omdb_data["Poster"]

      series.save!
    end
    series
  end

  def handle_episode(series, season, episode)
    if series.episodes.where(season: season, episode: episode).blank?

    end
  end

  def handle_data(data)
    series = handle_series(data[:show_name])
    handle_episode(series, data[:season], data[:episode])
  end

end