from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Author, Book
from .serializers import AuthorSerializer

@api_view(['GET', 'POST'])
def index(request):
  return Response('this is an index page')


@api_view(['GET'])
def get_author(request, id):
  author = Author.objects.get(id=id)
  serializer = AuthorSerializer(author)
  return Response(serializer.data)
