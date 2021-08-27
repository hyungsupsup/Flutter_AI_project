from json.decoder import JSONDecodeError
from flask import Flask, jsonify, request
import json

#declared an empty variable for reassignment
response = ''

#creating the instance of our flask application
app = Flask(__name__)

#route to entertain our post and get request from flutter app
@app.route('/user', methods = ['POST'])
def UserInfoRoute():

    #fetching the global response variable to manipulate inside the function
    global response
    
    try:
        request_data = request.data #getting the response data
        #request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
        request_data = json.loads(request_data.decode('utf-8'))
        name = request_data['userName'] #assigning it to name
        #email = request_data['email']
        response = f'Hi {name}! this is flask' #re-assigning response with the name we got from the user
        print(response)
        return " " #to avoid a type error
    except JSONDecodeError:
        return "error"
     
   

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0')



    