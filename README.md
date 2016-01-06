# ice-portal-speed-logger

Logs information about the current internet connection status, the train speed, its location, and the time in JSON format. This log can then be converted to a GPX file.

## Usage:

```sh
./logger.sh mytrip.json
```

After you are done logging, cancel the logger and convert the data to a gpx file:

```sh
TRAINID=42 ./converter.sh mytrip.json mytrip.gpx
```
