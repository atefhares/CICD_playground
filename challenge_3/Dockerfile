FROM python:3.7
RUN apt-get update
RUN apt-get install python3-pip -y
WORKDIR /python_app 
COPY ./PythonApp .
RUN pip install -r requirements.txt
CMD python hello.py