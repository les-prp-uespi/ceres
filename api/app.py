from flask import Flask, request, render_template, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name_user = db.Column(db.String(120), unique = False, nullable = False)
    login = db.Column(db.String(100), unique = True, nullable = False )
    password = db.Column(db.String(60), unique = False, nullable = False)
    course = db.Column(db.String(60), unique = False, nullable = False)

    def __init__(self, name, login, password, course):
        self.name_user = name
        self.login = login
        self.password = password
        self.course = course

class Material(db.Model):
    id_material = db.Column(db.Integer, primary_key = True)
    name_material = db.Column(db.String(100), unique = False, nullable = False)
    type_material = db.Column(db.String(50))
    def __repr__(self):
        return '<Material %r>' % self.name_material

class Reservations(db.Model):
    id_reservation_primary =  db.Column(db.Integer, primary_key = True)
    id_user = db.Column(db.Integer ,  db.ForeignKey('user.id'), nullable=False)
    id_reserva = db.Column(db.Integer,  db.ForeignKey('material.id_material'), nullable=False)
    data = db.Column(db.String(20), nullable = False)
    hour = db.Column(db.String(20), nullable = False)
    def __repr__(self):
        return '<Reservations %r>' % self.id_user



@app.route('/user', methods = ['POST'])
def create_user():
    if request.method == 'POST':
        
        name = request.json['name']
        login = request.json['login']
        password = request.json['password']
        course = request.json['course']
        #print(f'name: {name} , login: {login}, password: {password}, course: {course}')
        new_user = User(name, login, password, course)
        try:
            db.session.add(new_user)
            db.session.commit()
            return 'Cadastrado'
        except:
            return 'Error banco de dados'
    return 500
    
@app.route('/reservas', methods = ['GET'])
def get_reservas():
    return 'reservas'

if __name__ == "__main__":
    app.run(debug = True)