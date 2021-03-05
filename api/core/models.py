from django.db import models
from django.conf import settings

class Material(models.Model):

    TYPE_MATERIAL = (
        ('I', 'imovel'),
        ('M', 'movel')
    )

    name = models.CharField(max_length = 100, verbose_name='nome')
    type_material = models.CharField(max_length = 2, choices=TYPE_MATERIAL, verbose_name='tipo')

    class Meta:
        verbose_name = 'material'
        verbose_name_plural = 'materiais'
    
    def __str__(self):
        return self.name
    

class Reservation(models.Model):
    
    day = models.DateField(verbose_name='Dia reserva')
    start = models.TimeField(verbose_name='Horário inicio')
    end = models.TimeField(verbose_name='Horário final')
    material = models.ForeignKey(Material, on_delete=models.CASCADE, related_name='material')
    status = models.BooleanField(default=False)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete= models.CASCADE)

    class Meta:
        verbose_name = 'reserva'
        verbose_name_plural = 'reservas'

    def __str__(self):
        return self.user.name
