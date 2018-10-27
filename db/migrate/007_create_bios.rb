Sequel.migration do
  change do
    create_table(:bios) do
      primary_key :id

      Integer :artist_id
      String :content, text: true
    end
  end
end
