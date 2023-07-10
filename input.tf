variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "mains_vpc_info" {
  type = object({
    cidr_block = string
    availability_zone = list(string)
    private_subnet = list(string)
    public_subnet = list(string)
  })
  default = {
    cidr_block = "192.168.0.0/16"
    availability_zone = [ "a" , "b" ]
    private_subnet = [ "db1" , "db2" ]
    public_subnet = [ "web1" , "web2" ]
  }
}