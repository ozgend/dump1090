## Prepare dependencies & build

```bash
chmod +x prepare-dependencies.sh build.sh
./prepare-dependencies.sh && ./build.sh
```

## Build only

```bash
./build.sh [STD_CVER] [DUMP1090_VERSION]
# ie.
# ./build.sh c17 local-v01
```

or

```bash
make clean && make STD_CVER=[STD_CVER] DUMP1090_VERSION=[DUMP1090_VERSION]
# ie.
# make clean && make STD_CVER=c17 DUMP1090_VERSION=local-v01
```

## Run basic CLI

```bash
./dump1090 --interactive
```

## Run with daemon mode with network

```bash
./dump1090 --quiet --net [--net-ro-port <PORT>]
```

<sup>_`--net-ro-port`_: _default is TCP:30002_</sup>

## run with built-in HTML GUI

```bash
./dump1090 --quiet --net --write-json public_html/data
```

```bash
(cd public_html && λ python3 -m http.server 8090)
```
