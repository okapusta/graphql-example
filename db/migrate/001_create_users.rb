Sequel.migration do
  no_transaction

  change do
    create_table(:users) do
      primary_key :id

      String :email
      String :handle
    end
  end
end
