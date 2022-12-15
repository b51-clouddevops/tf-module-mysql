resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin1"
  password             = "RoboShop1"
  parameter_group_name = ????
  skip_final_snapshot  = true
}


resource "aws_db_parameter_group" "default" {
  name   = "rds-pg"
  family = "mysql5.6"
}

# # Creates Elastic Cache Cluster
# resource "aws_elasticache_cluster" "redis" {
#   cluster_id           = "roboshop-redis-${var.ENV}"
#   engine               = "redis"
#   node_type            = "cache.t3.micro"
#   num_cache_nodes      = 1
#   parameter_group_name = aws_elasticache_parameter_group.pg.name
#   engine_version       = "6.2"
#   port                 = 6379
#   subnet_group_name    = aws_elasticache_subnet_group.subnet-group.name
#   security_group_ids   = [aws_security_group.allows_redis.id]
# }

# # Creates Parameter Group from Elastic Cache Cluster
# resource "aws_elasticache_parameter_group" "pg" {
#   name   = "roboshop-parameter-grp-${var.ENV}"
#   family = "redis6.2"
# }

# # Creates Subnet Group
# resource "aws_elasticache_subnet_group" "subnet-group" {
#   name       = "redis-subnet-grp-${var.ENV}"
#   subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID

#   tags = {
#     Name = "redis-subnet-grp-${var.ENV}"
#   }
# }