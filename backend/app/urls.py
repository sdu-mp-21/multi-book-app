from django.urls import path
from . import views

urlpatterns = [
  path('', views.index, name='imdex'),
  path('register', views.register, name='register'),  # registers a user without logging in

  path('login', views.login, name='login'),           # log in a user, creates a token and responds with
                                                      # a cookie which contains that token

  path('logout', views.logout, name='logout'),        # destroys a token in browser cookies
  path('get_user', views.get_user, name='get_user'),  # responds with basic info about the logged user
  path('author/<int:id>', views.get_author, name='get_author'),
  path('author/all', views.get_authors, name='get_authors'),
  path('author/new', views.create_author, name='create_author'),
  path('author/delete/<int:id>', views.delete_author, name='delete_author'),
]