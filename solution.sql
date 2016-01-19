--Question 1
SELECT first_name, last_name 
FROM authors;

--Question 2
SELECT first_name, last_name 
FROM distinguished_authors;

--Question 3
SELECT first_name, last_name 
FROM authors WHERE authors.id 
NOT IN (SELECT id FROM distinguished_authors);

--Question 4
SELECT COUNT(id) 
FROM authors;

--Question 5
SELECT unnest(authors_and_titles[1:3][1]) 
FROM favorite_authors 
WHERE favorite_authors.employee_id = 
(SELECT id 
	FROM employees 
	WHERE first_name = 'Michael');

--Question 6
SELECT title 
FROM books 
WHERE id IN 
(SELECT book_id 
	FROM editions 
	WHERE isbn IN 
	(SELECT isbn 
		FROM stock 
		WHERE stock > 0));

--Question 7
INSERT INTO authors (id, last_name, first_name) VALUES(
20, 'Library', 'Carnegie');
INSERT INTO books (id, title, author_id, subject_id) VALUES(
20, 'The Handy Science Answer Book', 20, 14);
INSERT INTO editions (isbn, book_id, edition, publisher_id, publication, type) VALUES(
'0787610135', 20, 1, NULL, '1996-01-01', 'p');

--Question 8
SELECT first_name, last_name 
FROM authors 
WHERE id IN 
(SELECT author_id 
	FROM books INNER JOIN editions ON books.id = editions.book_id 
	WHERE isbn IN (SELECT isbn FROM stock WHERE stock = 0)) 
UNION SELECT first_name, last_name 
FROM authors WHERE id IN 
(SELECT author_id 
	FROM books INNER JOIN editions ON books.id = editions.book_id 
	WHERE isbn NOT IN (SELECT isbn FROM stock));

--Question 9
SELECT title 
FROM books INNER JOIN editions ON books.id = editions.book_id 
WHERE isbn IN 
(SELECT isbn 
	FROM stock 
	WHERE stock = 
	(SELECT MAX(stock) 
		FROM stock));




