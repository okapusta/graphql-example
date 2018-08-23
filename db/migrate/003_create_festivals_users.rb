Sequel.migration do
  change do
    create_table(:festivals_users) do
      primary_key :id

      String :user_id
      String :festival_id
    end
  end
end
