module "install" {
  source = "C:/Users/Slitstore/terraform1/modules/Ec2/install"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block             = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block             = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
}

resource "aws_subnet" "subnet_c" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block             = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-06aa3f7caf3a30282"
  instance_type = "t2.micro"
  count         = 3

  subnet_id = element([aws_subnet.subnet_a.id, aws_subnet.subnet_b.id, aws_subnet.subnet_c.id], count.index)

  tags = {
    Name = "${var.environment}-instance-${count.index + 1}"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install/ansibledoc.sh",
      "/tmp/install/ansibledoc.sh",
    ]
  }
}


output "instance_ip" {
  value = aws_instance.ec2_instance[*].public_ip
}
