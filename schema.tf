resource "null_resource" "schema" {
  provisioner "local-exec" {
    command = <<EOF 
cd /tmp 
curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
unzip -o mysql.zip 
cd mysql-main 
mysql -h ${aws_db_instance.mysql.address} -uadmin1  -pRoboShop1   <shipping.sql
EOF 
  }

}

# Loads the schema
resource "null_resource" "mongodb-schema" { 

  provisioner "local-exec" {
command = <<EOF
  cd /tmp/
  curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
  wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
  unzip -o mongodb.zip 
  cd mongodb-main 
  mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < catalogue.js
  mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < users.js
  
EOF   
  }
}