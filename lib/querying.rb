def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  JOIN series
  ON series.id = books.series_id
  WHERE series.id = 1
  ORDER BY(books.year)"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  GROUP BY(characters.motto)
  HAVING MAX(LENGTH(characters.motto))
  LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species)
  FROM characters
  GROUP BY(characters.species)
  ORDER BY(characters.species) DESC
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors #Fake a FULL OUTER JOIN?
"SELECT authors.name, subgenres.name
  FROM authors
  LEFT JOIN series
  ON authors.id = series.author_id
  LEFT JOIN subgenres
  ON subgenres.id = series.subgenre_id
  GROUP BY(authors.name)"

end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  JOIN characters
  ON series.id = characters.series_id
  GROUP BY(series.title)
  ORDER BY(COUNT(characters.species = 'human')) DESC
  LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in #use character_books join table!
  "SELECT characters.name, COUNT(character_books.book_id)
  FROM characters
  INNER JOIN character_books
  ON character_books.character_id = characters.id
  "
end
