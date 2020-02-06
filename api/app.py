from flask import Flask 
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api
from resources.user import UserCreate, UserModifications
from resources.resource import ResourceCreate, Resources, ResourceStatus
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///banco.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
api = Api(app)
@app.before_first_request
def create_db():
    db.create_all()
api.add_resource(UserCreate,'/') #criar usuario
api.add_resource(UserModifications,'/alterar/<int:id>')
api.add_resource(ResourceCreate, '/recurso')
api.add_resource(Resources, '/recursos')
api.add_resource(ResourceStatus, '/recurso/<int:id>')
if __name__ == '__main__':
    from database import db
    db.init_app(app)
    app.run(debug = True)
    