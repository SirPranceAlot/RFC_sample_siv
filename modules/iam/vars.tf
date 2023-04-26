# The path is added here because they can be unique if you want
# but for simplicity I'll put it all in the root folder

variable "groups" {
  type = list(object({
    name = string
    path = string
  }))
  default = [
    {
      name = "frontend-engineering"
      path = "/",
    },
    {
      name = "backend-engineering"
      path = "/"
    },
    {
      name = "data-engineering"
      path = "/"
    },
    {
      name = "sre"
      path = "/"
    }
  ]
}

variable "policies" {
  type = list(object({
    name        = string
    path        = string
    description = string
    policy = object({
      Version = string
      Statement = list(object({
        Action   = list(string),
        Effect   = string
        Resource = string
      }))
    })
  }))
}
