# from base image python
FROM python:3.7-alpine
# create directory /python_app and make it as working dirrectory
WORKDIR /python_app 
# copy the app content to /app
COPY ./PythonApp /python_app
# install dependencies from requirements.txt
RUN pip3 install -r requirements.txt
# run app
CMD python3 hello.py