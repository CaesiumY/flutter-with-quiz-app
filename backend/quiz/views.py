from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import QuizModel
from .serializer import QuizSerializer

@api_view(['GET'])
def helloAPI(request):
    return Response('hello world')