## user

```org
+-------------|--------------|------|-----|---------|----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------|--------------|------|-----|---------|----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| account     | char(11)     | NO   |     | NULL    |                |
| name        | varchar(128) | YES  |     | NULL    |                |
| signup_time | date         | NO   |     | NULL    |                |
| token       | varchar(64)  | YES  |     | NULL    |                |
| type        | tinyint(4)   | NO   |     | NULL    |                |
+-------------|--------------|------|-----|---------|----------------+
```

## lessee

```org
+----------|--------------|------|-----|---------|-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------|--------------|------|-----|---------|-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| position | varchar(128) | YES  |     | NULL    |       |
| score    | int(11)      | NO   |     | NULL    |       |
| realname | varchar(128) | NO   |     | NULL    |       |
| ci       | varchar(18)  | YES  |     | NULL    |       |
+----------|--------------|------|-----|---------|-------+
```

## Rental

```org
+----------|--------------|------|-----|---------|-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------|--------------|------|-----|---------|-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| position | varchar(128) | YES  |     | NULL    |       |
| score    | int(11)      | NO   |     | NULL    |       |
+----------|--------------|------|-----|---------|-------+
```

## orders

```org
+------------|--------------|------|-----|---------|----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------|--------------|------|-----|---------|----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment |
| starttime  | date         | NO   |     | NULL    |                |
| endtime    | date         | YES  |     | NULL    |                |
| startplace | varchar(32)  | YES  |     | NULL    |                |
| endplace   | varchar(32)  | YES  |     | NULL    |                |
| fee        | double       | NO   |     | NULL    |                |
| score      | int(11)      | NO   |     | NULL    |                |
| accepttime | date         | YES  |     | NULL    |                |
| finishtime | date         | YES  |     | NULL    |                |
| remark     | varchar(256) | NO   |     | NULL    |                |
| status     | tinyint(4)   | NO   |     | NULL    |                |
| lessee     | int(11)      | YES  | MUL | NULL    |                |
| rental     | int(11)      | NO   | MUL | NULL    |                |
+------------|--------------|------|-----|---------|----------------+
```

## service

```org
+----------|--------------|------|-----|---------|----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------|--------------|------|-----|---------|----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| time     | date         | NO   |     | NULL    |                |
| remark   | varchar(512) | NO   |     | NULL    |                |
| score    | int(11)      | NO   |     | NULL    |                |
| customer | int(11)      | NO   | MUL | NULL    |                |
| offer    | int(11)      | NO   | MUL | NULL    |                |
+----------|--------------|------|-----|---------|----------------+
```

## truck

```org
+-----------|--------------|------|-----|---------|----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------|--------------|------|-----|---------|----------------+
| id        | int(11)      | NO   | PRI | NULL    | auto_increment |
| no        | varchar(18)  | NO   |     | NULL    |                |
| load      | double       | NO   |     | NULL    |                |
| width     | double       | NO   |     | NULL    |                |
| heigth    | double       | NO   |     | NULL    |                |
| length    | double       | NO   |     | NULL    |                |
| type      | tinyint(4)   | NO   |     | NULL    |                |
| modelinfo | varchar(256) | YES  |     | NULL    |                |
| remark    | varchar(32)  | YES  |     | NULL    |                |
| lessee    | int(11)      | NO   | MUL | NULL    |                |
+-----------|--------------|------|-----|---------|----------------+
```

## auth_user 

```org
+--------------|--------------|------|-----|---------|----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------|--------------|------|-----|---------|----------------+
| id           | int(11)      | NO   | PRI | NULL    | auto_increment |
| password     | varchar(128) | NO   |     | NULL    |                |
| last_login   | datetime     | YES  |     | NULL    |                |
| is_superuser | tinyint(1)   | NO   |     | NULL    |                |
| username     | varchar(150) | NO   | UNI | NULL    |                |
| first_name   | varchar(30)  | NO   |     | NULL    |                |
| last_name    | varchar(30)  | NO   |     | NULL    |                |
| email        | varchar(254) | NO   |     | NULL    |                |
| is_staff     | tinyint(1)   | NO   |     | NULL    |                |
| is_active    | tinyint(1)   | NO   |     | NULL    |                |
| date_joined  | datetime     | NO   |     | NULL    |                |
+--------------|--------------|------|-----|---------|----------------+
```
