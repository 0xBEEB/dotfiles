#!/bin/zsh

OUTPUT=""

DAY_UNKNOWN=""
DAY_CLOUDY=""
DAY_FOG=""
DAY_HEAVY_RAIN=""
DAY_HEAVY_SHOWERS=""
DAY_HEAVY_SNOW=""
DAY_HEAVY_SNOW_SHOWERS=""
DAY_LIGHT_RAIN=""
DAY_LIGHT_SHOWERS=""
DAY_LIGHT_SLEET=""
DAY_LIGHT_SLEET_SHOWERS=""
DAY_LIGHT_SNOW=""
DAY_LIGHT_SNOW_SHOWERS=""
DAY_PARTLY_CLOUDY=""
DAY_SUNNY=""
DAY_THUNDERY_HEAVY_RAIN=""
DAY_THUNDERY_SHOWERS=""
DAY_THUNDERY_SNOW_SHOWERS=""
DAY_VERY_CLOUDY=""


NIGHT_UNKNOWN=""
NIGHT_CLOUDY=""
NIGHT_FOG=""
NIGHT_HEAVY_RAIN=""
NIGHT_HEAVY_SHOWERS=""
NIGHT_HEAVY_SNOW=""
NIGHT_HEAVY_SNOW_SHOWERS=""
NIGHT_LIGHT_RAIN=""
NIGHT_LIGHT_SHOWERS=""
NIGHT_LIGHT_SLEET=""
NIGHT_LIGHT_SLEET_SHOWERS=""
NIGHT_LIGHT_SNOW=""
NIGHT_LIGHT_SNOW_SHOWERS=""
NIGHT_PARTLY_CLOUDY=""
NIGHT_SUNNY=""
NIGHT_THUNDERY_HEAVY_RAIN=""
NIGHT_THUNDERY_SHOWERS=""
NIGHT_THUNDERY_SNOW_SHOWERS=""
NIGHT_VERY_CLOUDY=""

HOUR=$(date +"%H")
DAYTIME=true

if [ $HOUR -lt 6 ] || [ $HOUR -gt 20 ]; then
    DAYTIME=false
fi

WTTR_RESP=$(curl --silent "wttr.in/97233?format=j1" | jq '.current_condition[0]')

if [ ! $WTTR_RESP ]; then
    exit 1
fi

WEATHER_CODE=$(echo "$WTTR_RESP" | jq -r '.weatherCode')
TEMP=$(echo "$WTTR_RESP" | jq -r ".temp_F")
TOOLTIP=$(echo "$WTTR_RESP" | jq -r ".weatherDesc[0].value")


if [ $WEATHER_CODE = "113" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_SUNNY
    else
        OUTPUT=$NIGHT_SUNNY
    fi
elif [ $WEATHER_CODE = "116" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_PARTLY_CLOUDY
    else
        OUTPUT=$NIGHT_PARTLY_CLOUDY
    fi
elif [ $WEATHER_CODE = "119" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_CLOUDY
    else
        OUTPUT=$NIGHT_CLOUDY
    fi
elif [ $WEATHER_CODE = "122" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_VERY_CLOUDY
    else
        OUTPUT=$NIGHT_VERY_CLOUDY
    fi
elif [ $WEATHER_CODE = "143" ] || [ $WEATHER_CODE = "248" ] || [ $WEATHER_CODE = "260" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_FOG
    else
        OUTPUT=$NIGHT_FOG
    fi
elif [ $WEATHER_CODE = "266" ] || [ $WEATHER_CODE = "293" ] || [ $WEATHER_CODE = "296" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_LIGHT_RAIN
    else
        OUTPUT=$NIGHT_LIGHT_RAIN
    fi
elif [ $WEATHER_CODE = "302" ] || [ $WEATHER_CODE = "308" ] || [ $WEATHER_CODE = "359" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_HEAVY_RAIN
    else
        OUTPUT=$NIGHT_HEAVY_RAIN
    fi
elif [ $WEATHER_CODE = "176" ] || [ $WEATHER_CODE = "263" ] || [ $WEATHER_CODE = "353" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_LIGHT_SHOWERS
    else
        OUTPUT=$NIGHT_LIGHT_SHOWERS
    fi
elif [ $WEATHER_CODE = "299" ] || [ $WEATHER_CODE = "305" ] || [ $WEATHER_CODE = "356" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_HEAVY_SHOWERS
    else
        OUTPUT=$NIGHT_HEAVY_SHOWERS
    fi
elif [ $WEATHER_CODE = "182" ] || [ $WEATHER_CODE = "185" ] || [ $WEATHER_CODE = "281" ] || [ $WEATHER_CODE = "284" ] || [ $WEATHER_CODE = "311" ] || [ $WEATHER_CODE = "314" ] || [ $WEATHER_CODE = "317" ] || [ $WEATHER_CODE = "350" ] || [ $WEATHER_CODE = "377" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_LIGHT_SLEET
    else
        OUTPUT=$NIGHT_LIGHT_SLEET
    fi
elif [ $WEATHER_CODE = "179" ] || [ $WEATHER_CODE = "362" ] || [ $WEATHER_CODE = "365" ] || [ $WEATHER_CODE = "374" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_LIGHT_SLEET_SHOWERS
    else
        OUTPUT=$NIGHT_LIGHT_SLEET_SHOWERS
    fi
elif [ $WEATHER_CODE = "227" ] || [ $WEATHER_CODE = "320" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_LIGHT_SNOW
    else
        OUTPUT=$NIGHT_LIGHT_SNOW
    fi
elif [ $WEATHER_CODE = "230" ] || [ $WEATHER_CODE = "329" ] || [ $WEATHER_CODE = "332" ] || [ $WEATHER_CODE = "338" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_HEAVY_SNOW
    else
        OUTPUT=$NIGHT_HEAVY_SNOW
    fi
elif [ $WEATHER_CODE = "323" ] || [ $WEATHER_CODE = "326" ] || [ $WEATHER_CODE = "368" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_LIGHT_SNOW_SHOWERS
    else
        OUTPUT=$NIGHT_LIGHT_SNOW_SHOWERS
    fi
elif [ $WEATHER_CODE = "335" ] || [ $WEATHER_CODE = "371" ] || [ $WEATHER_CODE = "395" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_HEAVY_SNOW_SHOWERS
    else
        OUTPUT=$NIGHT_HEAVY_SNOW_SHOWERS
    fi
elif [ $WEATHER_CODE = "386" ] || [ $WEATHER_CODE = "200" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_THUNDERY_SHOWERS
    else
        OUTPUT=$NIGHT_THUNDERY_SHOWERS
    fi
elif [ $WEATHER_CODE = "389" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_THUNDERY_HEAVY_RAIN
    else
        OUTPUT=$NIGHT_THUNDERY_HEAVY_RAIN
    fi
elif [ $WEATHER_CODE = "392" ]; then
    if [ $DAYTIME ]; then
        OUTPUT=$DAY_THUNDERY_SNOW_SHOWERS
    else
        OUTPUT=$NIGHT_THUNDERY_SNOW_SHOWERS
    fi
else
    OUTPUT=$DAY_UNKNOWN
fi

echo "{\"text\": \"$OUTPUT $TEMP°F\", \"tooltip\": \"$TOOLTIP\"}"
