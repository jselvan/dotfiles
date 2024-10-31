function Query-CouchDb {
    param(
        [Parameter(Mandatory=$true)]
        [string]$dbname
        [string]$query
    )

	$database_url = "http://$($env:DB_HOST):$($env:DB_PORT)/$dbname"
}
