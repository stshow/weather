# weather

Dockerized version of https://github.com/schachmat/wego. 
This appears to be the same app currently used by the host of `wittr.in`. 

### Usage

1. Create an account on https://developer.forecast.io/register and grab your API key.
2. docker run -it --name weather -e FIO_API_KEY=**_API-KEY-HERE_** stshow/weather

### To re-run
3. docker start -a weather

Latitude and Longitude courtesy of https://freegeoip.app/json/

