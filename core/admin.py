from django.contrib import admin
from core import models

class ReservationAdmin(admin.ModelAdmin):
    list_display = ['user', 'material']
    fields = ('day', 'start', 'end', 'material', 'user', 'status')


class MaterialAdmin(admin.ModelAdmin):
    list_display = ['name', 'type_material']
    fields = ['name', 'type_material']



admin.site.register(models.Reservation, ReservationAdmin)
admin.site.register(models.Material, MaterialAdmin)
