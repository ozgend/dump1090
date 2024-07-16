## Basic CLI

```bash
./dump1090 --interactive
```

## Daemon mode with network

```bash
./dump1090 --quiet --net [--net-ro-port <PORT>]
```

<sup>_`--net-ro-port`_: _default is TCP:30002_</sup>

## With built-in HTML GUI

```bash
./dump1090 --quiet --net --write-json public_html/data
```

```bash
(cd public_html && λ python3 -m http.server 8090)
```
