from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Author, Book
from .serializers import AuthorSerializer, BookSerializer
import json

@api_view(['GET', 'POST'])
def index(request):
  return Response('this is an index page')

# Author CRUD
@api_view(['GET'])
def get_author(request, id):
  author = Author.objects.get(id=id)
  serializer = AuthorSerializer(author)
  return Response(serializer.data)

@api_view(['GET'])
def get_authors(request):
  authors = Author.objects.all()
  serializer = AuthorSerializer(authors, many=True)
  return Response(serializer.data)

@api_view(['POST'])
def create_author(request):
  request_body = json.loads(request.body.decode('utf-8'))
  author = Author(fullname=request_body['fullname'])
  author.save()
  serializer = AuthorSerializer(author)
  return Response(serializer.data)

@api_view(['DELETE'])
def delete_author(request, id):
  try:
    author = Author(id)
    credentials = author
    author.delete()
    return Response(f'Author {credentials} successfully deleted!')
  except:
    return Response('Author with this id does not exist')


# Book CRUD
@api_view(['GET'])
def get_book(request, id):
  book = Book.objects.get(id=id)
  serializer = BookSerializer(book)
  return Response(serializer.data)

@api_view(['GET'])
def get_books(request):
  books = Book.objects.all()
  serializer = BookSerializer(books, many=True)
  return Response(serializer.data)

@api_view(['POST'])
def create_author(request):
  request_body = json.loads(request.body.decode('utf-8'))
  book = Book(title=request_body['title'], description=request_body['description'], price=request_body['price'], cover=request_body['cover'], author=Author.objects.get(request_body['author']))
  book.save()
  serializer = AuthorSerializer(book)
  return Response(serializer.data)

@api_view(['DELETE'])
def delete_author(request, id):
  try:
    book = Book(id)
    credentials = book
    book.delete()
    return Response(f'Book {credentials} successfully deleted!')
  except:
    return Response('Book with this id does not exist')

