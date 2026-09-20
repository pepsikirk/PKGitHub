# PKGitHub
A simple GitHub iOS client built using the MVVM architecture.

# Overview
This project was a demo requirement for a job application I took previously. Since I put quite a bit of effort into it, I decided to open-source and upload it.

# Requirements

## Interfaces

1. **Home Page:** Displays all iOS developers on GitHub, showing only their avatars and usernames. Tapping an avatar navigates to that user's profile page.
2. **User Profile Page:** Displays detailed user information, including name, company, number of public repositories, followers count, and following count.

## Functional Requirements

1. Use **Alamofire**, **AFNetworking**, or another HTTP networking library to request GitHub's public API via `Search / Users` (https://developer.github.com/).

## Bonus Points

1. Implement pagination on the Home Page list view.
2. Preferably use **MVVM** as the application architecture.
