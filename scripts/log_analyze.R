
# PACKAGES -----------------------------
library(DBI)
library(data.table)
library(fluxer)
library(echarts4r)
library(glue)
library(crayon)

## Log into PostgresSQL ------------

con = DBI::dbConnect(
  RPostgres::Postgres(),
  host = Sys.getenv('PG_FLUX_HOST'),
  port = Sys.getenv('PG_FLUX_PORT'),
  dbname = Sys.getenv('PG_FLUX_DBNAME'),
  user = Sys.getenv('PG_FLUX_USER'),
  password = Sys.getenv('PG_FLUX_PSW'),
  sslmode = "require"  
)

if(exists("con")) {
  print(glue("{crayon::green('[CONNECTED PG]')}"))
} else {
  print(glue("{crayon::green('[ERROR PG]')}"))
}
