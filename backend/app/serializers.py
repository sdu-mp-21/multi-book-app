from django.db.models import fields
from rest_framework.serializers import ModelSerializer
from .models import Author

class AuthorSerializer:
  class Meta:
    model = Author
    fields = '__all__'