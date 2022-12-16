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
resource "null_resource" "mysql-schema" { 

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