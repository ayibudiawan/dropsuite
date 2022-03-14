SELECT DISTINCT ON (users.id) users.name, books.name, books.date
FROM users
JOIN books
  ON users.id = books.user_id
ORDER BY users.id, date DESC