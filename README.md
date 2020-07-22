# Jinja2 live parser

A jinja/ansible parser built using Flask.
All you need is Python and preferably [pip](https://pypi.python.org/pypi/pip). Can parse JSON and YAML inputs.


## Install

### Clone + pip

    $ git clone git@github.com:ghoto/jinja-ansible-repl.git
    $ pip install -r requirements.txt
    $ python parser.py

### Dockerfile

Build it:

    ./rebuild-docker.sh

Or simply pull it from registry (without building):

    docker run -d -p 5005:5000 elghoto/ansible-jinja-repl


## Usage

You are all set, go to `http://localhost:5005/` and have fun.
Custom ansible filters are pulled from the latest version of ansible in pip.


## Preview

![preview](http://i.imgur.com/T65xjAf.png)
