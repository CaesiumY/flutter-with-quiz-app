from rest_framework.response import Response
from rest_framework.decorators import api_view
import random
from .models import QuizModel
from .serializer import QuizSerializer

@api_view(['GET'])
def helloAPI(request):
    return Response('hello world')

@api_view(['GET'])
def randomQuiz(request, id):
    totalQuizs = QuizModel.objects.all()
    randomQuizs = random.sample(list(totalQuizs), id)
    serializer = QuizSerializer(randomQuizs, many=True)

    return Response(serializer.data)