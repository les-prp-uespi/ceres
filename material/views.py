from rest_framework import permissions, generics, filters
from material.serializers import MaterialSerializer
from core.models import Material

class MaterialView(generics.ListCreateAPIView):
    queryset = Material.objects.all()
    serializer_class = MaterialSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['type_material']
    permission_classes = [permissions.IsAuthenticated]




