Sequel.migration do
  change do
    create_table(:artists) do
      primary_key :id

      String  :name
    end
  end
end
