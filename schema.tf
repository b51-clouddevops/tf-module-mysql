resource "null_resource" "schema" {
  provisioner "local-exec" {
    command = <<EOF 
cd /tmp 
curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
unzip -o mysql.zip 
cd mysql-main 
mysql -h  mysqlDB_Address -uadmin1  -pRoboShop1   <shipping.sql


EOF 
  }

}