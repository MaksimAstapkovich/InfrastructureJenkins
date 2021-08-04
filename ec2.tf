resource "aws_security_group" "sg"{
  name = "MySg_FOR_JEN"
  
  ingress{
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 50000
    to_port = 50000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port   = 0
    protocol  = -1
    cidr_blocks= ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins" {
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  user_data = base64encode(templatefile("./script.sh",{gitLogin = "${var.login}" , gitPass = "${var.pass}"}))
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = aws_key_pair.key.id 
}
