from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from core import models
from django.utils.translation import gettext as _


class UserAdmin(BaseUserAdmin):

    ordering = ["id"]
    list_display = ["email", "name"] 
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal Info'), {'fields': ('name',)}),
        (
            _('Permissions'),
            {
                'fields': (
                    'is_active',
                    'is_staff',
                    'is_superuser',
                )
            }
        ),
        (_('Important dates'), {'fields': ('last_login',)}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide', ),
            'fields': ('email', 'password1', 'password2'),
        }),
    )


class ReservationAdmin(admin.ModelAdmin):
    list_display = ['user', 'material']
    fields = ('day', 'start', 'end', 'material', 'user', 'status')


class MaterialAdmin(admin.ModelAdmin):
    list_display = ['name', 'type_material']
    fields = ['name', 'type_material']



admin.site.register(models.Reservation, ReservationAdmin)
admin.site.register(models.Material, MaterialAdmin)
admin.site.register(models.User, UserAdmin)