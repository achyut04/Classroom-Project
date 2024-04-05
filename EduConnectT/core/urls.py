from django.urls import path,include
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('',include('django.contrib.auth.urls')),
    path('error/', views.error_page, name='error_page'),
    path('signup/',views.auth_signup,name='signup'),
    path('dashboard/', views.home , name='home'),
    path('create_class/', views.create_class , name='create_class'),
    path('join/', views.join_class , name='join_class'),
    path('classroom/<str:classcode>/', views.classroom_detail, name='classroom_detail'),
    path('download/<int:post_id>/', views.download_material, name='download_material'),
    path('create/<str:classcode>', views.create_post, name='create_post'),
    path('post/<int:post_id>/comment/', views.add_comment_to_post, name='add_comment_to_post'),
    path('submit/', views.submit_file, name='submit_file'),
    # path('class/<str:classcode>/<int:post_id>/submissions/', views.view_submissions, name='view_submissions'),
    # path('submissions/download/<int:submission_id>/', views.download_submission, name='download_submission'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)