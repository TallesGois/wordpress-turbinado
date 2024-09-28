# VPC
resource "aws_vpc" "wordpress_turbinado" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "VPC=Wordpress-Turbinado"
    }
}

# Subnets Públicas
resource "aws_subnet" "public_a" {
  vpc_id                    = aws_vpc.wordpress_turbinado.id
  cidr_block                = "10.0.1.0/24"
  availability_zone         = "us-east-1a"
  map_public_ip_on_launch   = true

  tags = {
    Name = "Pub-AZ-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                    = aws_vpc.wordpress_turbinado.id
  cidr_block                = "10.0.2.0/24"
  availability_zone         = "us-east-1b"
  map_public_ip_on_launch   = true

  tags = {
    Name = "Pub-AZ-b"
  }
}

# Tabela de rotas para sub-redes publicas
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.wordpress_turbinado.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.wordpress_turbinado.id
    }

    tags = {
      Name = "Public"
    } 
}

# Associar sub-redes públicas com a tabela de rotas pública
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

# Cria gateway de internet
resource "aws_internet_gateway" "wordpress_turbinado" {
    vpc_id = aws_vpc.wordpress_turbinado.id
  
    tags = {
      Name = "IGW-Wordpress-Turbinado"
    }
}