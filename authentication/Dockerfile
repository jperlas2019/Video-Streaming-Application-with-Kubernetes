FROM python:3.3

WORKDIR /var/src/app

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 8110
CMD [ "python3", "app.py"]
