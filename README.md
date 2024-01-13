# Snowman

## Introduction
This is a project based on macOS Apprentice book written by Sarah Reichelt for Kodeco (formerly Ray Wenderlich)

## Changes
I changed some parts of the project:

1 - The project is using Tuist to generate .xcproj and .xcworkspace files.

To generate your own it's needed to [install Tuist](https://docs.tuist.io/documentation/tuist/installation/) in your machine
and run the following command to generate the files:

```
tuist generate
```

2 - Instead of using high order function called `filter` to separate the candidate words and pick one of them up for the game, I'm using a linked list for this purpose.

You can check this in the function called `getRandomWord()` of the `Game` struct.

If you want it, you can change the strategy option to use the approach using filters, it suffices changin the strategy option to `.standard`, instead of `.linkedList`.
