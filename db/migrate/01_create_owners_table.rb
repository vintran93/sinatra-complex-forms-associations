class CreateOwnersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
    end
  end
end

# Migrations setup the tables in the database; 1st, run rake db:migrate

# 2nd, run rake db:seed
# We always have default data that we want to have in our application for testing purposes
# The seed command exists to automate this process.

# This will migrate our database and seed it with one owner and two pets to get us started.