from database import db

class ResourcesModel(db.Model):
    __tablename__ = "resources"
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(40), unique = True)
    type_resource = db.Column(db.String(20))

    def __init__(self, name, type_resource):
        self.name = name
        self.type_resource = type_resource
    
    def json(self):
        return{
            "id": self.id,
            "name": self.name,
            "type resource": self.type_resource
        }
    def save_resource(self):
        db.session.add(self)
        db.session.commit()
    
    def delete_resource(self):
        db.session.delete(self)
        db.session.commit()


    @classmethod
    def find_resouce(cls, id):
        resource = cls.query.filter_by(id = id).first()    
        if resource:
            return resource
        return None
        
    def update(self, name, type_resource):
        self.name = name
        self.type_resource = type_resource

    @classmethod
    def check_resource(cls,name):
        resource = cls.query.filter_by(name = name).first()
        if resource:
            return resource
        return None
    @classmethod 
    def all_resouces(cls):
        return cls.query.all()

    