from django.db import models

# Create your models here.


class QuizModel(models.Model):
    title = models.CharField(max_length=50)
    body = models.TextField()
    answer = models.IntegerField()

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("QuizModel_detail", kwargs={"pk": self.pk})
