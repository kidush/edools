## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edools'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edools

## Usage

You have to set your `api_key` and your `base_uri` to access the Edools API.
There are two ways to use the configure method:

The first one:

```Ruby
Edools.configure('<YOUR_API_KEY>', '<BASE_URI>')
```

or you can use:

```Ruby
Edools.configure do |config|
  config.api_key = '<YOUR_API_KEY>'
  config.base_uri = '<BASE_URI>'
end
```

**Remember:** You have to change `<YOUR_API_KEY>` and `<BASE_URI>` with your own credentials and custom subdomain based on Edools API. It's important for you to know that `api_key` is only for create the school. As soon as you've created a new school you will receive in **response** an admin credentials key. This new token you will can Update your school, handle courses, products and students.

## School

### Creating a new School:

```Ruby
Edools::School.create(name, email, password)
```

it will return a **response** with your credentials and some others data about school you've created:

```
{ 
  "school"=> {
	"id" => 711, 
	"subdomain" => "teste-escola2", 
	"name" => "teste escola 2"
  },
   
  "library" => { "id" => 711 }, 
  
  "organization" => {
    "id" => 705, 
    "name" => "Nome da Escola"
  }, 
  
  "admin" => { 
    "id" => 588449, 
    "full_name" => "Nome da Escola", 
    "email" => "email@escola.com",       
    "credentials" => "<ADMIN_KEY_COMES_HERE>", 
    "role_id" => 9975
  }, 
  
  "forum" => { "id" => 711 }
}
```

### Updating a School:

To use the update method you will need your `admin_key`. When you have created a school an `admin_key` has been created and added automatically to your `Edools.config.admin_key`. If you need change the `admin_key`. You will have to set manually the key:

```Ruby
Edools.config.admin_key = <YOUR_ADMIN_KEY>
```

After set your `admin_key` you can update the school.

```Ruby
Edools::School.update(id, { name: 'my update school name', subdomain: 'my-school-subdomain' })
```

To know more about the School endpoint and params access the [API Documentation](http://docs.edools.com/api/V1/SchoolsController.html).

## Courses

### Creating a new Course

To create a new course you have the method below:

```Ruby
Edools::Course.create({name: 'My Course'})
```

### Getting all Courses from school

To get all courses from the school you've already created, just do that:

```Ruby
Edools::Course.all
```

To know more about the Course endpoint just access the [API Documentation](http://docs.edools.com/api/V1/CoursesController.html).

## School Products

### Creating a new product

```Ruby
Edools::SchoolProduct.create({title: 'My Product'})
```

### Getting products

```Ruby
Edools::SchoolProduct.all
```

To know more about the SchoolProducts endpoint just access the [API Documentation](http://docs.edools.com/api/V1/SchoolProductsController.html).


## Invitation

### Inviting a student

```Ruby
Edools::Invitation.create(
  first_name: 'My name', 
  last_name: 'Last name', 
  email: '', 
  password: '', 
  password_confirmation: '' 
)
```
To know more about the Invitations endpoint just access the [API Documentation](http://docs.edools.com/api/V1/InvitationsController.html).

## Students

### Getting all Students from school

```Ruby
Edools::Student.all
```

### Getting all students from School product

```Ruby
Edools::Student.all(school_product_id: 43343)
```

To know more about the Student endpoint just access the [API Documentation](http://docs.edools.com/api/V1/UsersController.html).

## Sessions

### Creating a new user session

Disclaimer: To create a session you have to set the api_key and base_uri in Edools.configure method. 
I plan to set session credential without api_key and base_uri in the future.

```Ruby
Edools::Session.create(email: 'your-email@domain.com', password: 'your-password', type: 'School', id: 'school-id')
```

## Media

### Getting a media

```Ruby
Edools::Media.find(id)
```

Ps: To getting a media you will need the Session credentials

Disclaimer: To create a session you have to set the api_key and base_uri in Edools.configure method. 
I plan to set session credential without api_key and base_uri in the future.

```Ruby
Edools::Session.create(email: 'your-email@domain.com', password: 'your-password', type: 'School', id: 'school-id')
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kidush/edools_ruby.
