# Dockerfile for docker-flask web application

# Add a base image to build this image off of
FROM ubuntu:latest

COPY requirements.txt /usr/src/app/
COPY app.py /usr/src/app/

RUN apt-get update -y && apt-get install -y \
	python-pip \
	python-dev \
	build-essential
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Add a default port containers from this image should expose
EXPOSE 5000 

# Add a default command for this image
CMD ["python", "/usr/src/app/app.py"]