How to run
----------
```
mkdir npm-data && cd $_

docker create \
	--name sonarr \
	-p 5080:5080 \
	-v ${PWD}:/npm-data \
	local-npm
```

Clearing the cache
------------------

If you see `No compatible version found:` errors and the local-npm URI differs from the central npm info you can remove all of the data and start again (it's a cache)

```
$ docker stop npm-mirror && sudo mv /npm-data /npm-data.tmp; sudo mkdir /npm-data; docker start npm-mirror
```
