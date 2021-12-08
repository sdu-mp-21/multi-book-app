from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    username = models.CharField(db_index=True, max_length=255, unique=True)
    # name = models.CharField(max_length=255)
    email = models.CharField(max_length=255, unique=True)
    password = models.CharField(max_length=255)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [
        'username'
    ]

class Author(models.Model):
  fullname = models.CharField(max_length=500)
  user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)

  def __str__(self):
    return self.fullname


class Book(models.Model):
  title = models.CharField(max_length=200)
  description = models.CharField(max_length=1000)
  price = models.FloatField()
  cover = models.ImageField()
  author = models.ForeignKey(to=Author, related_name='books', on_delete=models.SET_NULL, null=True)

