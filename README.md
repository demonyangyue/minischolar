# Minischolar

Your personal file management website. You can use it to manage your own files, upload, download and search.

## Features

* Support distributed files and indices, capable of serving large amount of files.
* Support searching based on the file name, modified date and file content.
* Support mulitple file formats, PDF, MS Word, txt, html etc.
* Support multiple files uploading.

## Dependencies

* Ruby 2.1.1 or higher.
* [Elasticsearch](http://elasticsearch.org) 1.1.1 and or higher.

## Installation

Install it from a source code checkout:
  
    git clone https://github.com/demonyangyue/minischolar.git
    bundle install

## Usage

Take a look at the config/secrets.yml file, set the environment variable GMAIL_USERNAME and GMAIL_PASSWORD .

For ubuntu instance, you can add two lines at the and of ~/.bashrc:

```bash
export GMAIL_USERNAME="YourEmailAddress"
export GMAIL_PASSWORD="ApplicatonSpecificPassword"
```
Then

```bash
rake db:migrate
rake db:seed
rails server
```
Enjoy it at localhost:3000.

## Mainly used gems

* rails
* bootstrap
* devise
* pundit
* kaminari
* carrierwave
* elasticsearch-rails
* elasticsearch-model
* jquery-fileupload-rails


