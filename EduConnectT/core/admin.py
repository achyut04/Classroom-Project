from django.contrib import admin
from .models import Classroom,enrollment,post,comment

admin.site.register(Classroom,)
admin.site.register(enrollment)
admin.site.register(post)
admin.site.register(comment)