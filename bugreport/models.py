from django.db import models
from django.db.models import TextChoices


class CustomChoices(TextChoices):
    unknown = "", "Unknown"
    choice_1 = "choice 1", "Choice 1"
    choice_2 = "choice 2", "Choice 2"
    choice_3 = "choice 3", "Choice 3"
    choice_4 = "choice 4", "Choice 4"


class TestModel(models.Model):
    choice_field = models.CharField(
        max_length=30,
        blank=True,
        choices=CustomChoices.choices,
        default=CustomChoices.unknown,
    )
