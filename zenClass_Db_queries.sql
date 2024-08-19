
-- -> CREATE A DATABASE:-
         
         CREATE DATABASE `zen_class`;

-- -> CREATE TABLE INSIDE D/B :-
         
         CREATE TABLE `zen_class`.`users`(create table users(

         user_id integer auto_increment primary key,

         user_name varchar (255) NOT NULL,

         email varchar (255) NOT NULL,

         createdAt datetime ,
               --   // createdAt datetime DEFAULT CURRENT_TIMESTAMP,


         batch integer

););


-- -> INSERT VALUE INTO TABLE:-

        INSERT INTO `zen_class`.`users`( `user_name`, `email`, `createdAt`, `batch`)

        VALUES ('karthik', 'karthi@gmail.com',CURRENT_TIMESTAMP(),1),

       ('gayu', 'gayu@gmail.com',CURRENT_TIMESTAMP(),2),

       ('maha','maha@gmail.com',CURRENT_TIMESTAMP(),3),

       ('mugilan', 'mugil@gmail.com',CURRENT_TIMESTAMP(),4),

       ('iniya', 'iniya@gmail.com' ,CURRENT_TIMESTAMP(),5);

-- -> CREATE FOREIGN KEY :-

     ALTER TABLE `users`  add foreign key (`batch`) references batch_data (`batch_id`);

-- -> CREATE TABLE CODEKATA:-
     
    CREATE TABLE  `codeketa`(

                           `code_id` integer auto_increment primary key,

                          `user_id` integer,

                          `number_of_problem` integer,

                           `status_problem` varchar(255),

                          FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)

                         );

-- -> INSERT VALUE INTO CODEKATA:-
     
       INSERT INTO `codeketa`( `user_id`, `number_of_problem` ,`status_problem`)
                     VALUES  (6,20,'pending'),

                             ( 6,20,'finished'),

                             (7,40, 'finished'),

                             (7,40,'finished'),

                             (8,50,'finished');

                            

                --   select * from codeketa;
-> DELETE :-
            --  delete from codeketa where code_id in(2,3,4,5);

            --  delete from users where user_id in(1,2,3,4,5);




-- -> CREATE TABLE COMPANY_DRIVES:-

            CREATE TABLE `company_drives` (

            `drive_id` INT(255) NOT NULL AUTO_INCREMENT PRIMARY KEY,

            `user_id` INT (255),

            `drive_date` DATE,

            `company` VARCHAR(100),

            FOREIGN KEY (`user_id`) REFERENCES users(`user_id`)

            );


--   -> INSERT VALUES INTO COMPANY_DRIVES:-
   
            INSERT INTO `company_drives`.`company_drives`(`user_id`, `drive_date`, `company`) 
            VALUES (6,makedate(2024, 3), “Apple”),

                   (6,makedate(2024, 5), “Amazon”),

                   (7,makedate(2024, 3), “Zomato”),

                   (7,makedate(2023, 12), “Flipkart”),

                   (8,makedate(2023,5), “TCS”);


            
            select * from company_drives;


-- delete from company_drives where user_id in(1,2,3,4,5);          
------------------------------------------------------------------
master data -2:

-- -> CREATE TABLE "batch_data":-

                CREATE TABLE batch_data(

                batch_id int auto_increment primary key,

                batch_name varchar(100)

                );

          
-- -> INSERT VALUE INTO "batch_data":-

                insert into `batch_data`(`batch_name`)values

                    ('full stack-2023'),

                    ('full stack-2023'),

                    ('html-2023'),

                    ('css-2023'),

                    ('mongodb-2023');         

-- -> add FOREIGN key:-

             ALTER TABLE `zen_class`.` batch_data` ADD foreign key (`batch_id`)references `users`(`batch`);














---> "INNER JOIN TABLE" - COMMON value :-
------------------------------------------

                     SELECT users.batch,batch_data.batch_id

                     FROM users

                     INNER JOIN batch_data ON users.batch = batch_data.batch_id;

-->  CREATING TABLE "mentor":-
------------------------------

                     CREATE TABLE mentors (

                     mentorid INTEGER AUTO_INCREMENT PRIMARY KEY,

                     mentorname VARCHAR(100),

                     mentoremail VARCHAR(100)

                     );

--> INSERTING VALUE INTO "MENTOR":-
  -----------------------------
                     INSERT INTO mentors(mentorname, mentoremail) VALUES

                     ('Surya', 'suryakumar@gmail.com'),

                     ('Viji', 'vijay@gmail.com'),

                     ('arun', 'arun@gmail.com'),

                     ('prabhu', 'prabhu@gmail.com'),
                     
                     ('naga', 'naga@gmail.com');


                                                 -- INSERT INTO mentors(mentorname, mentoremail) VALUES

                                                 -- (“naga”,”naga@gmail.com”);

select * from mentors;

--—> CREATE TABLE TOPICS :-
-----------------------------

                     CREATE TABLE topics (

                     topicid INTEGER AUTO_INCREMENT PRIMARY KEY,

                     topic VARCHAR(200),

                     topic_date DATE,

                     mentor_id integer,

                     FOREIGN KEY (mentor_id) REFERENCES mentors(mentorid)

                     );
-- > INSERT VALUES INTO "TOPICS" :-
     ----------------------------

INSERT INTO topics(`topic`, `topic_date`, `mentor_id`) VALUES

                     ('HTML — Basics', '2023–04–01', 1),

                     ('NodeJS — Basics', '2023–06–03', 2),

                     ('JavaScript — Basics', '2023–07–05', 3),

                     ('React — Basics', '2023–08–06', 4),

                     ('mysql -Basic', '2023–09–5', 5);

select * from topics;


--—> CREATE TABLE "tasks":
--------------------------

                     CREATE TABLE tasks (

                     taskid INTEGER AUTO_INCREMENT PRIMARY KEY,

                     topic_id integer,

                     task VARCHAR(1000),

                     batch_id INTEGER,

                     FOREIGN KEY (topic_id) REFERENCES topics(topicid)

                     );

--> INSERT VALUES INTO "tasks" :-
  -------------------------------

                     INSERT INTO tasks(topic_id, task, batch_id)VALUES

                     (1, 'HTML Task', 1),

                     (2, 'Javascript Task',2),

                     (3, 'React Task',3),

                     (4, 'NodeJs Task',4),

                     (5, 'Mysql task',5);


select * from tasks;

--—> CREATE TABLE "attendance":-
    ---------------------------

                     CREATE TABLE attendance (

                     attendanceid INTEGER AUTO_INCREMENT PRIMARY KEY,

                     user_id integer,

                     topicsid INTEGER,

                     attended BOOLEAN,

                     FOREIGN KEY ( user_id) REFERENCES users( user_id),

                     FOREIGN KEY (topicsid) REFERENCES topics(topicid)

                     );

-- >INSERT VALUES INTO "attendance":-
-------------------------------------

                     INSERT INTO attendance( user_id, topicsid, attended) VALUES

                     (6, 3, true),

                     (6, 1, true),

                     (7, 2, false),

                     (7, 4, true),

                     (8, 4, true);

                     select * from attendance;