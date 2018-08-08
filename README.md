# weather

Dockerized version of https://github.com/schachmat/wego. 
This appears to be the same app currently used by the host of `wittr.in`.

![Screenshot](https://raw.githubusercontent.com/stshow/weather/master/weather-scrot.png)

 weather/weather-scrot.png 
### Usage

Currently `forecast.io` is the default weather provider. However the entrypoint supports the following:

#### OpenWeatherMap https://home.openweathermap.org

```
-e BACKEND=openweathermap
-e OWM_API_KEY=<YOUR-KEY-HERE>
```

#### WorldWeatherOnline https://www.worldweatheronline.com/

```
-e BACKEND=worldweatheronline
-e WWO_API_KEY
```

#### Steps to run with default `forecast.io`:

1. Create an account on https://developer.forecast.io/register and grab your API key.
2. `docker run -it --name weather -e FIO_API_KEY=<YOUR-KEY-HERE> stshow/weather`

### To re-run
3. `docker start -a weather`

### Location 
Latitude and Longitude courtesy of https://freegeoip.app/json/ by default.

Specify custom locations with:

```
-e LOCATION=
```
The default `forecast.io` only supports latitude and longitude:

```
-e LOCATION=40.748,-73.985
```

While others support:

```
-e LOCATION="New York"
```
##### Note: Most testing has been performed with the default provider.
---
- Test with more providers. 
- Add more environment variables to the `entrypoint` for configuring `.wegorc`. 
