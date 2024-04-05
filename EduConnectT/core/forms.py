from django import forms
from .models import post  
from .models import comment
from .models import post
from .models import Submissions

class SubmissionsForm(forms.ModelForm):
    class Meta:
        model = Submissions
        fields = ['material']

# class PostForm(forms.ModelForm):
#     class Meta:
#         model = post
#         fields = ['classroom_id', 'title', 'description', 'matirial', 'is_assignment', 'due_date', 'due_time', 'total_marks']

#     def clean(self):
#         cleaned_data = super().clean()
#         is_assignment = cleaned_data.get('is_assignment')
        

#         if is_assignment :
#             due_date = cleaned_data.get('due_date')
#             due_time = cleaned_data.get('due_time')
#             if not due_date or not due_time:
#                 raise forms.ValidationError("If this post is an assignment, please provide due date and time.")
            
#         return cleaned_data


class PostForm(forms.ModelForm):
    class Meta:
        model = post
        fields = ['classroom_id', 'title', 'description', 'matirial', 'is_assignment', 'due_date', 'due_time', 'total_marks']
        widgets = {
            'due_date': forms.DateInput(attrs={'type': 'date'}),
            'due_time': forms.TimeInput(attrs={'type': 'time'}),
        }

    def __init__(self, *args, **kwargs):
        super(PostForm, self).__init__(*args, **kwargs)
        self.fields['total_marks'].required = False 

    def clean(self):
        cleaned_data = super().clean()
        is_assignment = cleaned_data.get('is_assignment')
        due_date = cleaned_data.get('due_date')
        due_time = cleaned_data.get('due_time')

        if is_assignment:
            if not due_date or not due_time:
                raise forms.ValidationError("If this post is an assignment, please provide due date and time.")

        return cleaned_data





class PostForm(forms.ModelForm):
    class Meta:
        model = post
        exclude = ['classroom_id']
        
class CommentForm(forms.ModelForm):
    class Meta:
        model = comment
        fields = ['content']        
