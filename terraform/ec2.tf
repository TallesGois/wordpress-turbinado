# Cria minhas instâncias EC2
resource "aws_instance" "wordpress_a" {
  ami                         = "ami-08c40ec9ead489470" # Ubuntu Server 20.04 LTS para us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_a.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.wordpress_key_pair.key_name

  tags = {
    Name = "wordpress-az-a"
  }
}

resource "aws_instance" "wordpress_b" {
  ami                         = "ami-08c40ec9ead489470" # Ubuntu Server 20.04 LTS para us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_b.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.wordpress_key_pair.key_name

  tags = {
    Name = "wordpress-1-az-b"
  }
}

resource "aws_instance" "wordpress_c" {
  ami                         = "ami-08c40ec9ead489470" # Ubuntu Server 20.04 LTS para us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_b.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.wordpress_key_pair.key_name

  tags = {
    Name = "wordpress-2-az-b"
  }
}

resource "aws_instance" "wordpress_d" {
  ami                         = "ami-08c40ec9ead489470" # Ubuntu Server 20.04 LTS para us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_a.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.wordpress_key_pair.key_name

  tags = {
    Name = "wordpress-2-az-a"
  }
}

# Adiciona a chave pública na AWS
resource "aws_key_pair" "wordpress_key_pair" {
  key_name   = "wordpress-turbinado-key"
  public_key = file("~/.ssh/wordpress-turbinado-key.pub")
}