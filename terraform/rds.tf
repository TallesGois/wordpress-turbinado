# Especifica o grupo de subnets para meu BD
resource "aws_db_subnet_group" "wordpress_rds_subnet_group" {
  name       = "wordpress-rds-subnet-group"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  tags = {
    Name = "wordpress-rds-subnet-group"
  }
}

# Cria minha instância RDS = MySQL
resource "aws_db_instance" "wordpress_rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7.44"
  instance_class         = "db.t3.micro"
  db_name                = "wordpressdb"  
  username               = "admin"
  password               = "admin1234"
  db_subnet_group_name   = aws_db_subnet_group.wordpress_rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  skip_final_snapshot    = true
  
# Configs para não gerar custos.
  backup_retention_period = 0
  multi_az                = false

  tags = {
    Name = "Wordpress-RDS"
  }
}
