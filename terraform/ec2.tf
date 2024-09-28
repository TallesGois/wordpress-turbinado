# Cria minhas instâncias EC2
resource "aws_instance" "wordpress_a" {
  ami                         = "ami-0c02fb55956c7d316" #Imagem amazon linux
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
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_b.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.wordpress_key_pair.key_name

  tags = {
    Name = "wordpress-az-b"
  }
}

# Adiciona a chave pública na AWS
resource "aws_key_pair" "wordpress_key_pair" {
  key_name   = "wordpress-turbinado-key"
  public_key = file("~/.ssh/wordpress-turbinado-key.pub")
}