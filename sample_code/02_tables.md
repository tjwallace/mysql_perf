!SLIDE

# Tables

!SLIDE smaller

# posts

    +------------+--------------+------+-----+---------+----------------+
    | Field      | Type         | Null | Key | Default | Extra          |
    +------------+--------------+------+-----+---------+----------------+
    | id         | int(11)      | NO   | PRI | NULL    | auto_increment |
    | title      | varchar(255) | YES  |     | NULL    |                |
    | body       | text         | YES  |     | NULL    |                |
    | user_id    | int(11)      | YES  | MUL | NULL    |                |
    | published  | tinyint(1)   | YES  | MUL | 0       |                |
    | created_at | datetime     | YES  | MUL | NULL    |                |
    | updated_at | datetime     | YES  |     | NULL    |                |
    +------------+--------------+------+-----+---------+----------------+

!SLIDE smaller

# users

    +------------+--------------+------+-----+---------+----------------+
    | Field      | Type         | Null | Key | Default | Extra          |
    +------------+--------------+------+-----+---------+----------------+
    | id         | int(11)      | NO   | PRI | NULL    | auto_increment |
    | name       | varchar(255) | YES  |     | NULL    |                |
    | created_at | datetime     | YES  |     | NULL    |                |
    | updated_at | datetime     | YES  |     | NULL    |                |
    +------------+--------------+------+-----+---------+----------------+

!SLIDE

# Data

## 1,000 users
## 100,000 posts
