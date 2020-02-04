from flask import Flask 
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api
from resources.user import UserCreate, UserModifications
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///banco.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
api = Api(app)
@app.before_first_request
def create_db():
    db.create_all()
api.add_resource(UserCreate,'/') #criar usuario
api.add_resource(UserModifications,'/alterar/<int:id>')
if __name__ == '__main__':
    from database import db
    db.init_app(app)
    app.run(debug = True)
    