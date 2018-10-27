Sequel.migration do
  change do
    create_table(:artists_festivals) do
      primary_key :id

      Integer :artist_id
      Integer :festival_id
    end
  end
end
