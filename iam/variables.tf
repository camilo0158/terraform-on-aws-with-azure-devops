variable "region" {
    default = "us-east-2"
}

variable "users" {
    default = {
        apps = {
            users = ["jmartinez", "juan.martinez"]
            admins = ["jmartinez", "juan.martinez"]
        },
        sys_admin = {
            users = ["admin-01","admin-02"]
        },
        developer = {
            users = ["dev-01"]
        }
    }    
}