from django.db import models
from django.contrib.auth.models import AbstractBaseUser, UserManager, \
                                        PermissionsMixin
from django.conf import settings

class CustomUserManager(UserManager):
    
    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError(_('The given username must be set'))
        email = self.normalize_email(email)
        user = self.model(email=email, is_staff=is_staff, is_active=True, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    def create_user(self, email=None, password=None, **extra_fields):
        return self._create_user(email, password, False, False, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        user=self._create_user( email, password, True, True, **extra_fields)
        user.is_active=True
        user.is_superuser = True
        user.save(using=self._db)
        return user
    
class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'



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
