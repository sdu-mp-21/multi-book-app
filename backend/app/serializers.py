from django.db.models import fields
from rest_framework.serializers import ModelSerializer
from .models import Author, Book, User

class AuthorSerializer(ModelSerializer):
  class Meta:
    model = Author
    fields = '__all__'

class BookSerializer(ModelSerializer):
  class Meta:
    model = Book
    fields = '__all__'


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = [
            'id',
            'username',
            'email',
            'password'
        ]
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)

        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance