创建普通用户
```mysql
CREATE USER albert IDENTIFIED BY 'kylin';

SHOW GRANTS FOR albert;

GRANT ALL ON *.* TO albert WITH GRANT OPTION;
```

导入测试数据

: https://github.com/datacharmer/test_db
