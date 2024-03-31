# lib/tasks/empty_database.rake

namespace :db do
    desc 'Empty all tables in the database'
    task empty: :environment do
      ActiveRecord::Base.connection.tables.each do |table|
        next if table == 'schema_migrations' # Skip the schema migrations table
        # For postgres
        # ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE;")
        
        # Sqlite3 does not support TRUNCATE, equivalent --> DELETE FROM without where clause
        ActiveRecord::Base.connection.execute("DELETE FROM #{table};")
      end
      puts 'All tables have been emptied.'
    end
end
  