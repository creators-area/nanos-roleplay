NanosRP.Database = Database(DatabaseEngine.SQLite, "db=database_filename.db timeout=2")

function NanosRP:Query(query, callback, ...)
    NanosRP.Database:Execute(query, callback, ...)
end

function NanosRP:Select(query, callback, ...)
    NanosRP.Database:Select(query, callback, ...)
end