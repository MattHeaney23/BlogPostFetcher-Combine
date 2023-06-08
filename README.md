# BlogPostFetcher-Combine
A blog reader - A challenge to showcase Combine skills

## Overview
As part of learning the Combine framework, I asked ChatGPT for a Combine challenge. This app is the solution I created.

## Challenge

Here is the challenge provided:

Create a simple blog post fetcher app using the Combine framework that does the following:

- Fetches blog posts from the JSONPlaceholder API (https://jsonplaceholder.typicode.com/posts).
- Parses the received JSON data into a list of Post objects.
- Updates the UI every time a new post is received.
- Allows the user to manually refresh the posts by tapping a "Refresh" button. This should use the Combine PassthroughSubject so the fetch action can be called manually.
- Use the Combine debounce operator to ensure the refresh action is only called at most once per second, even if the user taps the button multiple times quickly.
- Handles and prints any errors that occur during fetching or parsing without crashing the app.
