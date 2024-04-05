from django.shortcuts import redirect
from django.urls import reverse

class LoginRequiredMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        self.exclude_urls = [
            reverse('login'),  # Exclude the login page
            reverse('logout'),  # Exclude the logout page
            reverse('error_page'),  # Exclude the error page
            reverse('signup'),  # Exclude the error page
        ]

    def __call__(self, request):
        if not request.user.is_authenticated and request.path not in self.exclude_urls:
            return redirect(reverse('login'))  # Redirect to error page if not logged in and not on an excluded URL

        response = self.get_response(request)
        return response
