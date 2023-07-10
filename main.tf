resource "aws_vpc" "subbu" {
  cidr_block = var.subbu_vpc_info.vpc_cidr
}
tags {
    Name = "subbu"
} 


resource "aws_subnet" "subbu_subnet" {
  count = length(var.subbu_vpc_info.subnet_names)  
  vpc_id = aws_vpc.subbu.id
  cidr_block = cidrsubnet(var.subbu_vpc_info.vpc_cidr,8,count.index)
  availability_zone = var.subbu_vpc_info.availability_zone
}
depends_on = [
    aws_vpc.subbu
]
tags {
    Name = "subbu_subnet"
}