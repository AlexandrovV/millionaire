DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
	id INT,
	text VARCHAR(255),
    answer_id INT
);

insert into questions values( 1, "In the UK, VAT stands for value-added ...?", 3);
insert into questions values( 2, "Which colour is used as a term to describe an illegal market in
        rare goods?", 7);
insert into questions values( 3, "Which character was first played by Arnold Schwarzenegger in a 1984
        film?", 12);
insert into questions values( 4, "Which of these would a film actor like to receive?", 14);
insert into questions values( 5, "In which country would you expect to be greeted with the word
        'bonjour'?", 18);
insert into questions values( 6, "What name is given to the person who traditionally attends the
        groom on his wedding day?", 21);
insert into questions values( 7, "Which country is not an island?", 27);
insert into questions values( 8, "What name is given to a playing card with a single symbol on it?", 31);
insert into questions values( 9, "According to the old adage, how many lives does a cat have?", 35);
insert into questions values( 10, "Who has the authority to change a ball during a football match?", 40);

DROP TABLE IF EXISTS answers;
CREATE TABLE answers (
	id INT,
	text VARCHAR(255),
	is_right INT,
	question_id INT
);
insert into answers values( 1, "Transaction", 0, 1);
insert into answers values( 2, "Total", 0, 1);
insert into answers values( 3, "Tax", 1, 1);
insert into answers values( 4, "Trauma", 0, 1);
insert into answers values( 5, "Blue", 0, 2);
insert into answers values( 6, "Red", 0, 2);
insert into answers values( 7, "Black", 1, 2);
insert into answers values( 8, "White", 0, 2);
insert into answers values( 9, "The Demonstrator", 0, 3);
insert into answers values( 10, "The Instigator", 0, 3);
insert into answers values( 11, "The Investigator", 0, 3);
insert into answers values( 12, "The Terminator", 1, 3);
insert into answers values( 13, "Oliver", 0, 4);
insert into answers values( 14, "Oscar", 1, 4);
insert into answers values( 15, "Oliphant", 0, 4);
insert into answers values( 16, "Osbert", 0, 4);
insert into answers values( 17, "Italy", 0, 5);
insert into answers values( 18, "France", 1, 5);
insert into answers values( 19, "Spain", 0, 5);
insert into answers values( 20, "Wales", 0, 5);
insert into answers values( 21, "Best man", 1, 6);
insert into answers values( 22, "Top man", 0, 6);
insert into answers values( 23, "Old man", 0, 6);
insert into answers values( 24, "Poor man", 0, 6);
insert into answers values( 25, "Madagascar", 0, 7);
insert into answers values( 26, "Cuba", 0, 7);
insert into answers values( 27, "Germany", 1, 7);
insert into answers values( 28, "Jamaica", 0, 7);
insert into answers values( 29, "Whizz", 0, 8);
insert into answers values( 30, "Hotshot", 0, 8);
insert into answers values( 31, "Ace", 1, 8);
insert into answers values( 32, "Star", 0, 8);
insert into answers values( 33, "Five", 0, 9);
insert into answers values( 34, "Seven", 0, 9);
insert into answers values( 35, "Nine", 1, 9);
insert into answers values( 36, "Ten", 0, 9);
insert into answers values( 37, "Sky Sports", 0, 10);
insert into answers values( 38, "The home team", 0, 10);
insert into answers values( 39, "Alex Ferguson", 0, 10);
insert into answers values( 40, "The referee", 1, 10);