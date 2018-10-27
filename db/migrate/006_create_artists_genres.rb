Sequel.migration do
  change do
    create_table(:artists_genres) do
      primary_key :id

      Integer :artist_id
      Integer :genre_id
    end
  end
end
