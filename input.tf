variable "region" {
    type = string
    default = "ap-south-1"
}

variable "subbu_vpc_info" {
    type= object ({
    vpc_cidr = string    
    availability_zone = list(string)
    subnet_names = list(string)
})

default = {
    availability_zone = [ "a","b" ]
    vpc_cidr = "192.168.0.0/16"
    subnet_names = [ "web1", "web2" , "db1" ,"db2" ]
}
}