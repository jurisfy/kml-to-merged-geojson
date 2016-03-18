# Converting KML To Merged Geojson

These scripts will install the necessary tools to convert kml to geojson, and
then simplify the geojson to reduce the number of points.

## Preparation

If you haven't, run the following command via terminal from this folder:

```shell
./census2geojson-setup.sh
```

## Converting Folders

From this folder, run the following:

```shell
./census2geojson.sh [folder-name] [tolerance]
```

e.g. for Limpopo/bela-bela do the following type the following and press enter:

```shell
./census2geojson.sh Limpopo/bela-bela
```

This will add all the converted files, and the merged file, to
Limpopo/bela-bela/geojson, with a default tolerance of 0.005.

You can set a tolerance by doing the following:

```shell
./census2geojson.sh Limpopo/bela-bela 0.01
```

A higher value reduces the number of points on the polygon, but may invalidate
the polygon, too.

Validity of a polygon can be check at http://geojsonlint.com/
