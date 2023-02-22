variable region_prefix {
  type          = string
}

variable ordinal_prefix {
  type          = string
}

variable subscription_prefix {
  type          = string
}

variable vnet_name {
  type          = string
}

variable resource_group_name {
  type          = string
}

variable location {
  type          = string
}

variable addressspace {
  type          = list(string)
}

variable subnet_prefix {
  type          = list
}

variable policy_name_prefix {
  type          = string 
}

variable inbound_rules {
  type          = list(map(string))
  default       = []
  description   = "list of objects that represents the configuration of each inbound rule"
}

variable outbound_rules {
  type          = list(map(string)) 
  default       = []
  description   = "list of objects that represents the configuration of each outbound rule"
}