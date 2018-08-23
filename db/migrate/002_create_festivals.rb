Sequel.migration do
  change do
    create_table(:festivals) do
      primary_key :id

      String :name
      String :place
    end
  end
end
