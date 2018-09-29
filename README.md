# docker-python
[![](https://images.microbadger.com/badges/image/smizy/python.svg)](https://microbadger.com/images/smizy/python "Get your own image badge on microbadger.com") 
[![](https://images.microbadger.com/badges/version/smizy/python.svg)](https://microbadger.com/images/smizy/python "Get your own version badge on microbadger.com")
[![CircleCI](https://circleci.com/gh/smizy/docker-python.svg?style=svg&circle-token=822259374f0e19d00e65a8bd19ea0f0a0e630de3)](https://circleci.com/gh/smizy/docker-python)

Python3 docker image based on alpine

# Usage

```
# print version
$ docker run -it --rm -v $(pwd):/code -p 8000:8000 smizy/python:3.6-alpine python --version
Python 3.6.5

# run built-in python cgi server (.py files in cgi-bin or htbin dir)
$ docker run -it --rm -v $(pwd):/code -p 8000:8000 smizy/python built-in cgi
Serving HTTP on 0.0.0.0 port 8000 ...
172.17.0.1 - - [27/Nov/2016 02:53:20] "GET /cgi-bin/test.py HTTP/1.1" 200 -

```