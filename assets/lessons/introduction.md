# Introduction

## Overview

This tutorial aims to guide you through the process of building an [educative.io](http://educative.io/) clone using Flutter and Supabase. We will cover the basic concepts of Flutter and Supabase and how to integrate them to create a fully functional education platform identical to [educative.io](http://educative.io/).

Throughout this tutorial, we will provide step-by-step instructions to help you develop your own education platform. We will begin by setting up the development environment, installing the necessary tools, and creating a new Flutter project. Then we will dive into creating the UI components and integrating Supabase to store and retrieve data.

By the end of this tutorial, you will have a fully working education platform built with Flutter and Supabase. You will gain a better understanding of these technologies and how to use them together to create powerful applications.

Let's get started!

## Features to be created

- Home page (displaying a list of courses)
- Course Detail page (displaying detail of course)
- Lessons page (displaying lesson content)

## Demo app

The demo app that we will build in this tutorial will be a clone of [educative.io](http://educative.io/), which is an online education platform that provides interactive courses on various programming languages and technologies. The app will have a home page displaying a list of courses, a course detail page displaying the details of a particular course, and a lessons page displaying the lesson content for a specific course.

<embed>https://www.loom.com/embed/cf976c5010e841ab98ac94faedd8cae6</embed>

## The technologies used

We will be using Flutter, a cross-platform framework for building high-performance, high-fidelity, apps for iOS, Android, web, and desktop, and Supabase, an open-source Firebase alternative that provides a suite of tools for building scalable web and mobile applications. Flutter is an excellent choice for building apps quickly, while Supabase is a great choice for building scalable backend services.

## Schema of the Architecture of the Application

The architecture of the application will consist of three main components: the frontend, which will be built using Flutter and will run on iOS, Android, web, and desktop; the database, which Supabase will host and will store all the necessary data for our application; and the Flutter Supabase SDK will be used to integrate the frontend with the Supabase Database.

Here is a diagram that illustrates the architecture of our application:

![https://raw.githubusercontent.com/sahibul-nf/educative_app_clone/main/screenshots/architecture-schema.png](https://raw.githubusercontent.com/sahibul-nf/educative_app_clone/main/screenshots/architecture-schema.png "Architecture Schema")

## Database schema

The database schema will consist of two tables: courses, and lessons. The course table will store information about each course, such as the course name, description, and price. The lessons table will store information about each lesson of a course, such as a lesson name, description, and content. These tables will be hosted on Supabase and accessed using the Flutter Supabase SDK to provide data to the front end of our application.

![https://raw.githubusercontent.com/sahibul-nf/educative_app_clone/main/screenshots/supbase-schema.png](https://raw.githubusercontent.com/sahibul-nf/educative_app_clone/main/screenshots/supbase-schema.png "Database Schema")
