from rest_framework import serializers
from core.models import Material


class MaterialSerializer(serializers.ModelSerializer):

    class Meta:
        model = Material
        fields = (
            'id',
            'name',
            'type_material',
        )

