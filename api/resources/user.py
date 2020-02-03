from flask_restful import Resource, reqparse
from models.user_model import UserModel

class UserCreate(Resource):
    args = reqparse.RequestParser()
    args.add_argument("name", required= True)
    args.add_argument('login', required= True)
    args.add_argument('password', required= True)
    args.add_argument('course', required= True)
    def post(self):
        arg = UserCreate.args.parse_args()
        user = UserModel(**arg)
        try:
            user.save_user()
            return user.json(), 201
        except:
            return {"message": "error when trying to create user"}, 500
        

        

        