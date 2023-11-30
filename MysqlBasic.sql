

CREATE user 'testaccount'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'testaccount'@'%';



REVOKE DELETE,DROP  ON * . * FROM 'testaccount'@'%';

DROP USER 'testaccount'@'%';