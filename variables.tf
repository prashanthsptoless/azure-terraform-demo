variable solution{
    type        = string
}

variable env_prefix{
    type        = string
}

variable businessunit{
    type        = string
}

variable owner{
    type        = string
}

variable location{
    type        = string
}

variable subscription_prefix{
    type        = string
}

variable subscription_prefix1{
    type        = string
}

variable subscription_prefix2{
    type        = string
}

variable region_prefix{
    type        = string
}

variable ordinal_prefix{
    type        = string
}

variable hubaddressspace{
    type        = list(string)
}

variable prodaddressspace{
    type        = list(string)
}

variable nonprodaddressspace{
    type        = list(string)
}


variable prodsubnet_prefix{
    type        = list
}

variable nonprodsubnet_prefix{
    type        = list
}

variable hubsubnet_prefix{
    type        = list
}

variable app_name_prefix {
    type        = string 
}

variable account_replication_type {
    type        = string 
}

variable account_tier {
    type        = string 
}

#variable subscription_id {}

variable policy_name_prefix{
    type        = string
}

variable cloud{
    type        = string
}

variable powershellscript {
    type        = string
}
