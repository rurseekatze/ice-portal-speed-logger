# ice-portal-speed-logger

Tool for logging information about German ICE trains using the REST API of the "ICE Portal". Logs information about the current internet connection status, the train speed, its location, and the time in JSON format. This log can then be converted to a GPX file.
You need to be logged into the train WiFi to use this tool. First and second class both work.

## Usage

```sh
./logger.sh mytrip.json
```

After you are done logging, cancel the logger and convert the data to a gpx file:

```sh
TRAINID=42 ./converter.sh mytrip.json mytrip.gpx
```
