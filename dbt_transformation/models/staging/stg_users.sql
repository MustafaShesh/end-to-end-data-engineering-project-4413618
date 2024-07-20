select id, email, gender, address
from {{ source("RAW_DATA", "USERS") }}