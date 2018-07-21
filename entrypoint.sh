#!/bin/sh

LOCATION=$(printf %s "$(curl -s https://freegeoip.app/json/ | jq '.latitude,.longitude')" | tr '\n' ',')
sed -i "/location=/c\location=${LOCATION}" /root/.wegorc

if [ ! -z "$BACKEND" ]; then
    sed -i "/backend=/c\backend=${BACKEND}" /root/.wegorc
else
    sed -i "/backend=/c\backend=forecast.io" /root/.wegorc
fi

if [ ! -z $UNITS ]; then
    sed -i "/units=/c\units=${UNITS}" /root/.wegorc
else
    sed -i "/units=/c\units=imperial" /root/.wegorc
fi

if [ ! -z "$FIO_API_KEY" ] && [ ! -z "$OWM_API_KEY" ] || [ ! -z "$WWO_API_KEY" ]; then
    echo -en "\nToo many API keys!\nTry using just one.\n"
    exit 1
elif [ ! -z "$FIO_API_KEY" ]; then
    sed -i "/forecast-api-key=/c\forecast-api-key=${FIO_API_KEY}" /root/.wegorc
elif [ ! -z "$OWM_API_KEY" ]; then
    sed -i "/forecast-api-key=/c\owm-api-key=${OWM_API_KEY}" /root/.wegorc
elif [ ! -z "$WWO_API_KEY" ]; then
    sed -i "/forecast-api-key=/c\wwo-api-key=${WWO_API_KEY}" /root/.wegorc
fi

exec "$@"
