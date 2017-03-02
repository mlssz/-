## user

```org
+----------------|--------------|------|-----|-------------------|----------------+
| Field          | Type         | Null | Key | Default           | Extra          |
+----------------|--------------|------|-----|-------------------|----------------+
| id             | int(11)      | NO   | PRI | NULL              | auto_increment |
| account        | char(11)     | NO   |     | NULL              |                |
| name           | varchar(128) | YES  |     | 无名              |                |
| pre_login_time | datetime     | NO   |     | CURRENT_TIMESTAMP |                |
| signup_time    | datetime     | NO   |     | CURRENT_TIMESTAMP |                |
| token          | varchar(64)  | YES  |     | NULL              |                |
| type           | tinyint(4)   | NO   |     | 0                 |                |
+----------------|--------------|------|-----|-------------------|----------------+
```

## lessee

```org
+------------|--------------|------|-----|---------|-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------|--------------|------|-----|---------|-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| position_x | double       | NO   |     | 0       |       |
| position_y | double       | NO   |     | 0       |       |
| score      | int(11)      | NO   |     | 0       |       |
| realname   | varchar(128) | NO   |     | NULL    |       |
| ci         | varchar(18)  | YES  |     | NULL    |       |
| password   | varchar(256) | NO   |     | NULL    |       |
+------------|--------------|------|-----|---------|-------+
```

## Rental

```org
+------------|---------|------|-----|---------|-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------|---------|------|-----|---------|-------+
| id         | int(11) | NO   | PRI | NULL    |       |
| position_x | double  | NO   |     | 0       |       |
| position_y | double  | NO   |     | 0       |       |
| score      | int(11) | NO   |     | 0       |       |
+------------|---------|------|-----|---------|-------+
```

## orders

```org
+------------|--------------|------|-----|-------------------|----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------|--------------|------|-----|-------------------|----------------+
| id         | int(11)      | NO   | PRI | NULL              | auto_increment |
| starttime  | datetime     | NO   |     | CURRENT_TIMESTAMP |                |
| endtime    | datetime     | YES  |     | NULL              |                |
| startplace | varchar(32)  | YES  |     | NULL              |                |
| endplace   | varchar(32)  | YES  |     | NULL              |                |
| fee        | double       | NO   |     | 0                 |                |
| score      | int(11)      | NO   |     | 0                 |                |
| accepttime | datetime     | YES  |     | NULL              |                |
| finishtime | datetime     | YES  |     | NULL              |                |
| remark     | varchar(256) | NO   |     | NULL              |                |
| status     | tinyint(4)   | NO   |     | 0                 |                |
| lessee     | int(11)      | YES  | MUL | NULL              |                |
| rental     | int(11)      | NO   | MUL | NULL              |                |
+------------|--------------|------|-----|-------------------|----------------+
```

## service

```org
+----------|--------------|------|-----|-------------------|----------------+
| Field    | Type         | Null | Key | Default           | Extra          |
+----------|--------------|------|-----|-------------------|----------------+
| id       | int(11)      | NO   | PRI | NULL              | auto_increment |
| time     | datetime     | NO   |     | CURRENT_TIMESTAMP |                |
| remark   | varchar(512) | NO   |     | NULL              |                |
| score    | int(11)      | NO   |     | -1                |                |
| customer | int(11)      | NO   | MUL | NULL              |                |
| offer    | int(11)      | NO   | MUL | NULL              |                |
+----------|--------------|------|-----|-------------------|----------------+
```

## truck

```org
+----------|--------------|------|-----|---------|----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------|--------------|------|-----|---------|----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| no       | varchar(18)  | NO   |     | NULL    |                |
| loads    | double       | NO   |     | 0       |                |
| width    | double       | NO   |     | 0       |                |
| heigth   | double       | NO   |     | 0       |                |
| length   | double       | NO   |     | 0       |                |
| type     | tinyint(4)   | NO   |     | 0       |                |
| moreinfo | varchar(256) | YES  |     | NULL    |                |
| remark   | varchar(32)  | YES  |     | NULL    |                |
| lessee   | int(11)      | NO   | MUL | NULL    |                |
+----------|--------------|------|-----|---------|----------------+
```

## auth_user 

```org
+--------------|--------------|------|-----|---------|----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------|--------------|------|-----|---------|----------------+
| id           | int(11)      | NO   | PRI | NULL    | auto_increment |
| password     | varchar(128) | NO   |     | NULL    |                |
| last_login   | datetime(6)  | YES  |     | NULL    |                |
| is_superuser | tinyint(1)   | NO   |     | 0       |                |
| username     | varchar(150) | NO   | UNI | NULL    |                |
| first_name   | varchar(30)  | NO   |     | NULL    |                |
| last_name    | varchar(30)  | NO   |     | NULL    |                |
| email        | varchar(254) | NO   |     | NULL    |                |
| is_staff     | tinyint(1)   | NO   |     | 0       |                |
| is_active    | tinyint(1)   | NO   |     | 1       |                |
| date_joined  | datetime(6)  | NO   |     | NULL    |                |
+--------------|--------------|------|-----|---------|----------------+
```

## line

```org
+------------|--------------|------|-----|---------|----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------|--------------|------|-----|---------|----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment |
| startplace | varchar(32)  | YES  |     | NULL    |                |
| endplace   | varchar(32)  | YES  |     | NULL    |                |
| center     | varchar(256) | YES  |     | NULL    |                |
| createtime | date         | YES  |     | NULL    |                |
| remark     | varchar(128) | NO   |     | NULL    |                |
| lessee     | int(11)      | YES  | MUL | NULL    |                |
| rental     | int(11)      | NO   | MUL | NULL    |                |
+------------|--------------|------|-----|---------|----------------+
```
