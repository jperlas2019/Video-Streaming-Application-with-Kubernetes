from flask import Flask, request
import json
import os

app = Flask(__name__)

@app.route('/', methods = ['POST'])
def authenticate():
    if request.json['username'] == 'test' and request.json['password'] == '123':
        print(True)
        return json.dumps({'success':True}), 200, {'ContentType':'application/json'} 
    else:
        print(False)
        return json.dumps({'success':False}), 200, {'ContentType':'application/json'} 


if __name__ == '__main__':
    app.run(debug=True, host=os.environ['POD_IP'], port=8110)