from django.urls import path
from . import views

urlpatterns = [
  path('', views.index, name='imdex'),
  path('author/<:id>', views.get_author, name='get_author')
]