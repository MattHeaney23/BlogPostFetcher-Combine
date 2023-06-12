# BlogPostFetcher-Combine

A blog reader - A challenge to showcase Combine skills

## Overview

To gain experience using Combine, I asked ChatGPT to generate challenges to complete. This repository contains my solution to the challenge.

##  The Challenge

Here is the challenge provided:

Create a simple blog post fetcher app using the Combine framework that does the following:

- Fetches blog posts from an API
- Parses the received JSON data into a list of Blog objects.
- Updates the UI when a new post is received.
- Allows the user to manually refresh the posts by tapping a "Refresh" button. This should use the Combine PassthroughSubject so the fetch action can be called manually.
- Use the Combine debounce operator to ensure the refresh action is only called at most once per second, even if the user taps the button multiple times quickly.
- Handles and prints any errors that occur during fetching or parsing without crashing the app.

## About The Solution

### Blog Posts:
- I hosted a json file of an array of blog posts using Firebase Storage. This repository uses a direct URL to get this data. This blog data is all fictional and was generated by ChatGPT.
- I created a blog object to mirror the blog posts fetched.
- The view model backing the main view handles the loading state of the view, and manages the network request.
- I created a network service which returns a fetchData function. This function returns a publisher that uses URLSession's dataTaskPublisher, mapping the data and decoding it into the blog object. This function is generic for reusability.
- The view model contains a PassthroughSubject, which can be sent a value to start the use of the publisher from the network service.
- This PassthroughSubject is passed a value on launch, and when the user taps the refresh button.

### The Views:
- The views are all built in SwiftUI.
- The view showing all blog posts uses a list. The list is made up of a BlogRow object, which is a NavigationLink to a new view to see the full blog post.
- The loading and error states are set up as reusable views.

## Screenshots
![Blogster-HomePage](https://github.com/MattHeaney23/BlogPostFetcher-Combine/assets/129856192/3ddad033-ee57-4a9a-8742-ca62a802b2c0) ![Blogstar-BlogView](https://github.com/MattHeaney23/BlogPostFetcher-Combine/assets/129856192/6438c2df-41a6-4fd4-94db-a1f959625e26)

