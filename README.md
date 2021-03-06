# ip-resolver
Gernerates list of Domains hosted on the specific IP (based on virustotal API v3)

### Usage

- Clone the repo
- Go to `virustotal.com` and get your API key
- Update VARs (APIKEY and IP) at **[ip-resolver.sh](ip-resolver.sh)**
- Execute **[ip-resolver.sh](ip-resolver.sh)** and wait
- Check generated `./parsed-list.txt` for domains

### NOTE:

`parsed-list.txt` will contain historical data of domains hosted on specific IP.

To get actual hosted domains execute **[domain-checker.sh](domain-checker.sh)**