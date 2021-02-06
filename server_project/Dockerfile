FROM tensorflow/tensorflow:latest

# Add sample application
WORKDIR app

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt
ADD . .

EXPOSE 5000

# Run it
ENTRYPOINT ["python", "/app/application.py"]