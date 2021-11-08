Original App Design Project - README
===

# Push Fit

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
    
### Description
Push Fit is an app that provides a simple and clean interface to build your workout routines. The app has a variety of exercises to choose from whether you have access to weights, machines or just your body.


### App Evaluation

- **Category:** Fitness & Health
- **Mobile:** This type of application wouldn't be as useful if solely implemented on a desktop. A desktop version of this app would simply be used to save workouts to be viewed 
- **Story:** Presents users with an array of choices to build their workouts according to their needs.
- **Market:** Anyone leading or seeking an active lifestyle. Ability to save workout routines to be reused later
- **Habit:** The app can be quickly accessed whenever the user needs it. The ability to save routines can help schedule out workout days, incorporating the app in their daily routine.
- **Scope:** Initially this will be focused on simply picking and choosing exercises and manually building a workout routine. This concept can be further developed by automatically generating/suggesting routines based on muscle groups or equipment. Further additions could include a social aspect to share workouts and browse other people's routines.


## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can see a list of all available exercises 
* User can add/delete exercise to the list
* User can save their routine
* User can tap on cell to get a description on a excerise

**Optional Nice-to-have Stories**

* User can generate a random routine

### 2. Screen Archetypes

* Stream
    * User can tap on cell to get a description on a excerise
* Detail
  * User can add/delete workout to the list
* Creation
   * User can save their routine
   

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Saved Workouts



**Flow Navigation** (Screen to Screen)

* Home
    * Detail
    * Home
    * Creation (add a workout)
* Saved Workouts (stream)
    * Home
    * Creation
* Detail
    * Home (stream)
* Creation
    * Home (stream)
  

## Wireframes
<img src="https://i.imgur.com/oVqJZlb.png" width=800>


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | commentsCount | Number   | number of comments that has been posted to an image |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name

##### Game of Thrones API
- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /cities | gets all cities
    `GET`    | /cities/byId/:id | gets specific city by :id
    `GET`    | /continents | gets all continents
    `GET`    | /continents/byId/:id | gets specific continent by :id
    `GET`    | /regions | gets all regions
    `GET`    | /regions/byId/:id | gets specific region by :id
    `GET`    | /characters/paths/:name | gets a character's path with a given name
