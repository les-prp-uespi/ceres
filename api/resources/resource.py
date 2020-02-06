from models.resources_model import ResourcesModel
from flask_restful import Resource, reqparse
from flask import jsonify

args = reqparse.RequestParser()
args.add_argument("name", required= True, type=str)
args.add_argument("type_resource", required= True, type=str)

class Resources(Resource):
    def get(self):
        return {"recursos":[resource.json() for resource in ResourcesModel.all_resouces()]}

class ResourceCreate(Resource):
    def post(self):
        arg = args.parse_args()
        resource = ResourcesModel.check_resource(arg['name'])
        if resource:
            return {"message":"recurso já existe"},401
        try:
            resource = ResourcesModel(**arg)
            resource.save_resource()
            return resource.json(), 201
        except:
            return {"message": "erro interno"}, 500


class ResourceStatus(Resource):
    def delete(self, id):
        resource = ResourcesModel.find_resouce(id)
        if resource:
            try:
                resource.delete_resource()
                return {"message": "deletado"}, 200
            except:
                return {"message": "error ao tentar deletar"}, 500
        return {"message": "recurso não encontrado"} ,404

    def put(self, id):
        resource = ResourcesModel.find_resouce(id)
        arg = args.parse_args()
        if resource:
            resource.update(**arg)
            try:
                resource.save_resource()
                return resource.json(), 200
            except:
                return {"message":"error ao tentar atualizar"}, 500
        return {"message":"recurso não existe"}, 404


        


