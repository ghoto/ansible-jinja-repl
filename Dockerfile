###################################
# Jinja2 live parser Dockerfile
# Version: 0.1
# Author:  Sonu K. Meena(sahilsk)<sonukr666@gmail.com >
###################################

# Pull base image.
FROM python:2.7

ADD / data

WORKDIR /data

# Install dependencies
RUN pip install -r requirements.txt

# RUN apt-get update && apt-get -y install vim
# RUN apt-get -y install vim

# Change bind host
RUN sed -i 's/host=config.HOST/host="0.0.0.0"/g' parser.py

# Expose port to Host
EXPOSE 5000

# Define default command.
CMD ["python", "parser.py"]
