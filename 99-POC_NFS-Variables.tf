# VARIAVEIS DO PROJETO
variable "prefix_project" {
  description = "Prefixo do Projeto"
  type        = string
  default     = "POC-NFS"
}
# VARIAVEIS DE REGIÃO
variable "region" {
  type        = string
  default     = "brazilsouth"
  description = "Região do Projeto AVD"
}

variable "tags" {
  description = "Tags do Projeto"
  type        = map(any)
  default = {
    "Ambiente"    = "PocNFS"
  }
}

/*
locals {
  current_time           = timestamp()
  start_wallclock_time   = "7.55"
  current_wallclock_time = formatdate("h.mm", local.current_time)
  schedule_tomorrow      = (local.current_wallclock_time >= local.start_wallclock_time)
  today                  = formatdate("YYYY-MM-DD", local.current_time)
  tomorrow               = formatdate("YYYY-MM-DD", timeadd(local.current_time, "24h"))
  start_time             = "${local.schedule_tomorrow ? local.tomorrow : local.today}T07:55:00Z"
}
*/