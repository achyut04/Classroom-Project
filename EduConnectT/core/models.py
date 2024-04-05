from django.contrib.auth.models import User
from django.db import models
import datetime



class Classroom(models.Model):
    code = models.CharField(max_length=10,primary_key=True)
    name = models.CharField(max_length=50)
    capacity = models.IntegerField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    class_url = models.CharField(max_length=10)  

    
    def __str__(self):
        
        return f"Classroom : {self.name} {self.code}"
    
class enrollment(models.Model):
    students = models.ForeignKey(User,on_delete=models.CASCADE)
    enrolled = models.ForeignKey(Classroom, on_delete=models.CASCADE)    
    
    def __str__(self):
        return f"enrollment : {self.students} {self.enrolled}"
    
class post(models.Model):
    
    classroom_id=models.ForeignKey(Classroom,on_delete=models.CASCADE)
    title=models.CharField(max_length=50)
    description=models.TextField()
    posted_time=models.TimeField(auto_now_add=True) 
    posted_date=models.DateField(auto_now_add=True)
    matirial = models.FileField(upload_to ='posts/',max_length=256,null=True ,blank=True ,default=False) 
    
    is_assignment = models.BooleanField(default=False)
    due_date = models.DateField(null=True, blank=True)
    due_time = models.TimeField(null=True, blank=True)
    total_marks=models.IntegerField(default=100)
    

    def __str__(self):
        return f"{self.title}"



    
class comment(models.Model):
    post = models.ForeignKey(post, on_delete=models.CASCADE)
    content = models.TextField()
    author = models.ForeignKey(User, on_delete=models.PROTECT)
    time = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return  f"Comment by: {self.content}"
    

class Submissions(models.Model):
    post = models.ForeignKey(post, on_delete=models.CASCADE)
    user = models.ForeignKey(User , on_delete=models.CASCADE)
    material  = models.FileField(upload_to ='submissions/',max_length=256,null=True ,blank=True ,default=False)
    
    def _str_(self):
        return f'{self.post} {self.user} {self.material}'
    

    
# class Post(models.Model):
#     section = models.ForeignKey(section,on_delete=models.CASCADE)
#     title = models.CharField(max_length=80)
#     matirial = models.FileField(upload_to ='uploads/') 
#     # isAnnouncemet = models.BOOLEAN_STATES()
#     dueDate = models.DateField()
#     SubmissionState = {
#         'n':'None',
#         'a':'Assigned',
#         's':'submited',
#         'l':'turned in late'
#     } 
    