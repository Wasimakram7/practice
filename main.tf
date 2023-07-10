resource "aws_vpc" "mains" {
  cidr_block = var.mains_vpc_info.cidr_block
  tags  {
     Name = "mains"
  }
}
resource "aws_subnet" "private_subnet" {
    count = length(var.mains_vpc_info.private_subnet)
  availability_zone = "${var.region}${var.mains_vpc_info.availability_zone[count.index]}"
  cidr_block = cidrsubnet(var.mains_vpc_info.cidr_block, 8 , count.index)
  depends_on = [ 
    aws_vpc.mains
   ]
   tags = {
     Name = var.mains_vpc_info.private_subnet[count.index]
   }
}

resource "aws_subnet" "public_subnet" {
    count = length(var.mains_vpc_info.public_subnet)
  availability_zone = "${var.region}${var.mains_vpc_info.availability_zone[count.index]}"
  cidr_block = cidrsubnet(var.mains_vpc_info.cidr_block, 8 , count.index)
  depends_on = [ 
    aws_vpc.mains
   ]
   tags = {
     Name = var.mains_vpc_info.public_subnet[count.index]
   }
}