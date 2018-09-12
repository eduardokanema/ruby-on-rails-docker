select
  "id",
  concat(
    "unit",
    ' ',
    "number",
    ' ',
    "street",
    ', ',
    "city",
    ' ',
    "region",
    ' ',
    "postcode"
  ) as address
from addresses