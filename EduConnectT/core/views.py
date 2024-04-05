from django.shortcuts import render, redirect ,get_object_or_404
from django.contrib.auth import login,authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
import uuid
from .models import Classroom, enrollment ,post ,comment
from django.contrib.auth.models import User
from django.contrib import messages
import hashlib
from django import forms
from .forms import PostForm
from django.http import HttpResponse
import os
from itertools import chain
from .forms import CommentForm
from .models import Classroom, enrollment ,post ,comment ,Submissions
from .forms import PostForm,SubmissionsForm
from django.http import FileResponse, Http404


@login_required
def home(request):
    logged_in_user = request.user
    
    
    clases_enrolled = list(enrollment.objects.filter(students=logged_in_user).values_list('enrolled'))
    t = []
    for i in clases_enrolled:
        t.append(Classroom.objects.filter(code=i[0])[0])
    
    clases_managed = list(Classroom.objects.filter(created_by=logged_in_user))
    
    
    return render(request, "home.html", {'classrooms1': clases_managed,'classrooms2':t})

def generate_classroom_code():
    code = str(uuid.uuid4().hex)[:6]
    return code

def create_class(request):
    if request.method == 'POST':
        code = generate_classroom_code()
        while Classroom.objects.filter(code=code).exists():
            code = generate_classroom_code()
        hash_object = hashlib.sha256()
        hash_object.update(code.encode())
        hash_value = hash_object.hexdigest()[:10]
        name = request.POST.get('name')
        capacity = request.POST.get('capacity')
        new_classroom = Classroom(code=code, name=name, capacity=capacity,class_url=str(hash_value))
        new_classroom.created_by = request.user
        print(new_classroom.class_url)
        new_classroom.save()
        return redirect('home')    
        
    return render(request, 'create_class.html')
    # else:
    #     pass # wrong page error
    
    # return render(request, 'create_class.html')





def join_class(request):
    if request.method == 'POST':    
        user = request.user
        code = str(request.POST.get('code'))
        print(code)
        try:
            classroom = Classroom.objects.filter(code=code)[0]
            print(classroom)
        except Classroom.DoesNotExist:
            print('Error 1')
            return render(request, "home.html", {'messages': 'Classroom with this code does not exist.'})

        if enrollment.objects.filter(students=user).filter(enrolled=classroom).exists():
        #     print('Error 2')
        #     return render(request, "home.html", {'messages': 'You are already enrolled in this classroom.'})
        # else:
            return HttpResponse("You are already enrolled in this classroom.")

        er = enrollment(students=user,enrolled=classroom)
        er.save()
        return redirect('home')
        
    return render(request,'join_class.html')


def auth_signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=raw_password)
            # login(request,user)
            return redirect('login')  
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})

# def auth_login(request):
#     if request.method == 'POST':
#         username = request.POST.get('username')
#         password = request.POST.get('password')
#         user = authenticate(request, username=username, password=password)
#         if user is not None:
#             login(request,user)
#             return
#         else:
#             return render(request, 'login.html', {'error_message': 'Invalid login'})
#     else:
#         return render(request, 'login.html')


def error_page(request):
    return render(request, 'error.html')

def classroom_detail(request, classcode):
    print(classcode)
    posts = post.objects.filter(classroom_id=classcode).order_by('posted_time')
    
    
    class_ = Classroom.objects.get(code=classcode)
    
    comments = []
    dic = {}
    ix = 0
    for i in posts:
        comment_per_post = list(comment.objects.filter(post=i).order_by('time'))
        if len(comment_per_post)!=0:
            for c in comment_per_post:
                dic[ix] = list((c.post_id,User.objects.get(id=c.author_id).username,c.content,c.time))
                ix += 1
    print(dic)
    context = {'classs': class_,'posts': posts ,'comments':dic}
    return render(request, 'class.html', context)


def download_material(request, post_id):
    post_obj = get_object_or_404(post, pk=post_id)
    file_path = post_obj.matirial.path
    if os.path.exists(file_path):
        with open(file_path, 'rb') as file:
            response = HttpResponse(file.read())
            response['Content-Type'] = 'application/octet-stream'
            response['Content-Disposition'] = f'attachment; filename="{os.path.basename(file_path)}"'
            return response
    else:
        return HttpResponse("File not found")
    
# @login_required  # Ensure the user is logged in to access this view
# def create_post(request,classcode):
#     if request.method == 'POST':
#         form = PostForm(request.POST, request.FILES)
#         if form.is_valid():
#             post = form.save(commit=False)  # Save the form data without committing to the database yet
#             classs = Classroom.objects.get(code=classcode)
#             post.classroom_id = classs
#             post.save()  # Now save the post with the classroom_id set
            
#             return redirect('classroom_detail'  , classcode )
#     else:
#         form = PostForm()
#         return render(request, 'create_post.html', {'form': form})
    
@login_required
def create_post(request, classcode):
    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES)
        if form.is_valid():
            post = form.save(commit=False)
            classs = Classroom.objects.get(code=classcode)
            post.classroom_id = classs
            post.save()
            return redirect('classroom_detail', classcode)
    else:
        form = PostForm(initial={'is_assignment': request.GET.get('is_assignment', False)})

    return render(request, 'create_post.html', {'form': form})


@login_required
def add_comment_to_post(request, post_id):
    post_instance = get_object_or_404(post, id=post_id)
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment_instance = form.save(commit=False)
            comment_instance.author = request.user
            comment_instance.post = post_instance
            comment_instance.save()
            return redirect('classroom_detail', classcode=post_instance.classroom_id.code)
    else:
        form = CommentForm()
    return redirect('classroom_detail', classcode=post_instance.classroom_id.code)


def submit_file(request):
    if request.method == 'POST':
        form = SubmissionsForm(request.POST, request.FILES)
        if form.is_valid():
            submission = form.save(commit=False)
            post_id = request.POST.get('id_post')
            classcode = request.POST.get('classcode')
            submission.user = request.user  
            submission.post = post.objects.get(pk=post_id)
            submission.save()
            return redirect('classroom_detail' , classcode) 
    else:
        return HttpResponse("in submit_file via get")
    
@login_required
def download_submission(request, submission_id):
    submission = get_object_or_404(Submissions, id=submission_id)
    classroom = submission.post.classroom_id  

    if request.user != classroom.created_by:
        raise Http404("You are not allowed to download this file.")

    filepath = submission.submitted_file.path
    return FileResponse(open(filepath, 'rb'), as_attachment=True, filename=submission.submitted_file.name)

@login_required
def view_submissions(request, classcode):
    print("****************************************")
    classroom = get_object_or_404(Classroom, code=classcode)
    if request.user != classroom.created_by:
        return render(request, 'errors/not_allowed.html')
    
    submissions = Submissions.objects.filter(post__classroom_id=classroom).order_by('-submission_date')
    return render(request, 'view_submissions.html', {'submissions': submissions, 'classroom': classroom})