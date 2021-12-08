from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Author, Book, User
from rest_framework.exceptions import AuthenticationFailed, NotAuthenticated
from .serializers import AuthorSerializer, BookSerializer, UserSerializer
import json, jwt, datetime


def check_auth(request):
    """
    checks whether the is authorized or not and
    in case of a successful validation returns
    the user object of the current session
    ! IS NOT AN API VIEW
    :param request:
    :return: User object
    """
    token = request.COOKIES.get('jwt')  # get the jwt token from the request cookies

    if not token:
        raise NotAuthenticated('Unauthorized!')

    try:
        payload = jwt.decode(token, 'secret', algorithms=['HS256'])     # get decode the token to get the user id
    except jwt.ExpiredSignatureError:
        raise AuthenticationFailed('Token Expired!')

    user = User.objects.get(id=payload['id'])   # fetch the user object from id

    return user



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

@api_view(['POST'])
def login(request):
    """
    Takes username and password as
    parameters, logs in the user and
    returns an authorization token.
    If the user is not registered,
    returns 404 response and shows an appropriate message
    :param request:
    :return:
    """
    email = request.data['email']
    password = request.data['password']
    user = User.objects.get(email=email)

    if not user.check_password(password):
        raise AuthenticationFailed('Password is incorrect!')

    token = jwt.encode(
        {
            'id': user.id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(days=3),
            'iat': datetime.datetime.utcnow()
        },
        'secret',
        algorithm='HS256'
    )
    response = Response({'jwt': token})
    response.set_cookie(key='jwt', value=token, httponly=True)

    return response


@api_view(['POST'])
def register(request):
    """
    Takes username, email and password as parameters,
    and registers the user after validation.
    In case of failed validation (username already in use, etc.)
    responds with an appropriate message.
    :param request:
    :return:
    """
    serializer = UserSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    return Response(serializer.data)


@api_view(['POST'])
def logout(request):
    """
    Logs out the user
    :param request:
    :return:
    """
    response = Response({'message': 'success'})
    response.delete_cookie('jwt')

    return response


@api_view(['GET'])
def get_user(request):
    """
    Returns the basic info about the logged user
    :param request:
    :return:
    """
    user = check_auth(request)
    serializer = UserSerializer(user)
    return Response(serializer.data)