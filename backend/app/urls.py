from django.urls import path
from . import views

urlpatterns = [
  path('', views.index, name='imdex'),
  path('author/<int:id>', views.get_author, name='get_author'),
  path('author/all', views.get_authors, name='get_authors'),
  path('author/new', views.create_author, name='create_author'),
  path('author/delete/<int:id>', views.delete_author, name='delete_author'),
]