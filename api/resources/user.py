from flask_restful import Resource, reqparse

class User(Resource):
    args = reqparse.RequestParser()
    name = 
    def post(self):