FROM python:3.3

WORKDIR /var/src/app
RUN mkdir /var/src/app/videos

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 8090
CMD [ "python3", "app.py"]
