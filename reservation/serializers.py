from rest_framework import serializers
from core.models import Reservation
from material.serializers import MaterialSerializer

class ReservationSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    class Meta:
        model = Reservation
        fields = (
            'id',
            'day',
            'start',
            'end',
            'material',
            'user',
        )


class ReservationListSerializer(serializers.ModelSerializer):
    material = MaterialSerializer()
    class Meta:
        model = Reservation
        fields = (
            'id',
            'day',
            'start',
            'end',
            'material',
            'user',
        )