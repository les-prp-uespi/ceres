from rest_framework import serializers
from core.models import Reservation

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
            'user'
        )