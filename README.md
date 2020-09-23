# README

## Table of Contents
* [Introduction](#Introduction)
* [Getting Started](#getting-started)
* [Usage](#usage)
* [Loading Seed Data](#loading-seed-data)
* [Contributors](#contributors)
* [License](#license)
* [Changelog](#changelog)


## Introduction

I created a Rate My Pet website that is inspired from those Rate My *Noun* websites of the 1990s and early 2000s.

## Getting Started
To get started the database must be loaded by using the rake task `rake db:migrate`. Imagemagick is a dependency for ActiveStorage so it must be installed too. If using Ubuntu you can install Imagemagick via terminal by typing `sudo apt-get install imagemagick`. If you are using a different operating system installation instructions can be found from the website https://imagemagick.org/script/download.php.

## Usage
Non-registered users are free to view the gallery but cannot see or post comments of their own. When trying to do an action that requires a login the user will be redirected to the signup page. Users are free to sign up for an account, or sign in via a GitHub account. With an account, you can make comments on pictures, reply to other comments, and upload\edit your picture.


## Loading Seed Data
For demonstration purposes, there is an included seed_data.tar.xz that contains the files used for creating seed data with images. Extract the tar by your GUI, or the terminal commands ```tar -xf SeedData.tar.xz```. This should extract /db/seed.rb, and /db/seed_pictures/*. Load the seed data by using the command ```rake db:seed``` this will load dummy data for demoing purposes. 

## Contributors
If you would like to contribute fork the github repo, create your feature branch, commit changes and push the branch.

## License
(c) 2020 Vladimir Jimenez, all rights reserved. For Online Software Engineering PT - Ruby Rails Project

## Changelog
Version 1.0 (9/23/2020) Initial Release