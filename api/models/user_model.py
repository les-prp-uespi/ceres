from database import db

class UserModel(db.Model):
    
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100))
    login = db.Column(db.String(100), unique = True)
    password = db.Column(db.String(100))
    course = db.Column(db.String(40))

    def __init__(self, name, login, password, course):
        self.name = name
        self.login = login
        self.password = password
        self.course = course
    
    def save_user(self):
        db.session.add(self)
        db.session.commit()

    def json(self):
        return {
            "id": self.id,
            "name": self.name,
            "login": self.login,
            "password": self.password,
            "course": self.course
        }
    