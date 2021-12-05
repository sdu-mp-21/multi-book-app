from django.db import models

# Create your models here.

class Author(models.Model):
  fullname = models.CharField(max_length=500)


class Book(models.Model):
  title = models.CharField(max_length=200)
  description = models.CharField(max_length=1000)
  price = models.FloatField()
  cover = models.ImageField()
  author = models.ForeignKey(to=Author, related_name='books', on_delete=models.SET_NULL, null=True)

