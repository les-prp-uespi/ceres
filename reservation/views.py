from rest_framework import generics, permissions, status
from reservation.serializers import ReservationSerializer, ReservationListSerializer
from core.models import Reservation
from rest_framework.response import Response
from datetime import datetime


def is_authorize_reservation(new_reservation):
    
    reservations = Reservation.objects.filter(day=new_reservation['day'], material= new_reservation['material']).order_by('start')
    reservations_serializers = ReservationSerializer(reservations ,many = True)
    new_ts = datetime.strptime(new_reservation['start'],'%H:%M').time()
    new_te = datetime.strptime(new_reservation['end'],'%H:%M').time() 
    
    for reservation in reservations_serializers.data:
        ts = datetime.strptime(str(reservation['start']),'%H:%M:%S').time()
        te = datetime.strptime(str(reservation['end']), '%H:%M:%S').time()
        if ts == new_ts and te == new_te:
            return False
        elif (new_ts >= ts and new_ts <= te) or (new_te >= ts and new_te <= te):
            return False

    return True

class ReservationView(generics.ListCreateAPIView):

    queryset = Reservation.objects.all()
    serializer_class = ReservationSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)
    
        
    def create(self, request):
        new_reservation = request.data
        
        if(is_authorize_reservation(new_reservation)):

            serializer = self.get_serializer(data = new_reservation)
            serializer.is_valid(raise_exception=True)
            serializer.save()

            return Response(serializer.data, status= status.HTTP_200_OK)
        return Response({"msg":"Horário não disponivel"}, status= status.HTTP_401_UNAUTHORIZED)
    
    def list(self, request):
        queryset = self.filter_queryset(self.get_queryset())
        serializer = ReservationListSerializer(queryset, many=True)
        return Response(serializer.data)

class UpdateReservationView(generics.UpdateAPIView):
    queryset = Reservation.objects.all()
    serializer_class = ReservationSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self, pk):
        return self.queryset.get(pk=pk)
    
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        reservation =  self.get_queryset()
        serializer = self.get_serializer(reservation, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status= status.HTTP_200_OK)
        #return Response({"msg":"Horário não disponivel"}, status= status.HTTP_401_UNAUTHORIZED)




'''
class ReservationListView(generics.ListAPIView): # 4359e7a6f989fdc226cbd58c0e09357152a1b3b0
    queryset = Reservation.objects.all()
    serializer_class = ReservationListSerializer
    permission_classes = [permissions.IsAuthenticated]


    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)
    
'''
